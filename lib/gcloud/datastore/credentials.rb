# Copyright 2014 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "gcloud/credentials"

module Gcloud
  module Datastore
    ##
    # Authentication credentials to Google Cloud.
    # The most common way to create this object is to provide the path
    # to the JSON keyfile downloaded from Google Cloud.
    #
    # https://developers.google.com/accounts/docs/application-default-credentials
    class Credentials < Gcloud::Credentials #:nodoc:
      SCOPE = ["https://www.googleapis.com/auth/datastore",
               "https://www.googleapis.com/auth/userinfo.email"]
      ENV_VARS = ["DATASTORE_KEYFILE"]

      ##
      # Sign Oauth2 API calls.
      def sign_http_request request #:nodoc:
        if @client
          @client.fetch_access_token! if @client.expired?
          @client.generate_authenticated_request request: request
        end
        request
      end

      ##
      # Represent the empty credentials, useful for connecting
      # to a local devserver.
      class Empty #:nodoc:
        def sign_http_request request
          request
        end
      end
    end
  end
end
