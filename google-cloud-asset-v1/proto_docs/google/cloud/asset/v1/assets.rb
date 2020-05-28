# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!


module Google
  module Cloud
    module Asset
      module V1
        # An asset in Google Cloud and its temporal metadata, including the time window
        # when it was observed and its status during that window.
        # @!attribute [rw] window
        #   @return [::Google::Cloud::Asset::V1::TimeWindow]
        #     The time window when the asset data and state was observed.
        # @!attribute [rw] deleted
        #   @return [::Boolean]
        #     Whether the asset has been deleted or not.
        # @!attribute [rw] asset
        #   @return [::Google::Cloud::Asset::V1::Asset]
        #     An asset in Google Cloud.
        class TemporalAsset
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # A time window specified by its `start_time` and `end_time`.
        # @!attribute [rw] start_time
        #   @return [::Google::Protobuf::Timestamp]
        #     Start time of the time window (exclusive).
        # @!attribute [rw] end_time
        #   @return [::Google::Protobuf::Timestamp]
        #     End time of the time window (inclusive). If not specified, the current
        #     timestamp is used instead.
        class TimeWindow
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # An asset in Google Cloud. An asset can be any resource in the Google Cloud
        # [resource
        # hierarchy](https://cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy),
        # a resource outside the Google Cloud resource hierarchy (such as Google
        # Kubernetes Engine clusters and objects), or a Cloud IAM policy.
        # @!attribute [rw] name
        #   @return [::String]
        #     The full name of the asset. For example:
        #     `//compute.googleapis.com/projects/my_project_123/zones/zone1/instances/instance1`
        #
        #     See [Resource
        #     names](https://cloud.google.com/apis/design/resource_names#full_resource_name)
        #     for more information.
        # @!attribute [rw] asset_type
        #   @return [::String]
        #     The type of the asset. For example: `compute.googleapis.com/Disk`
        #
        #     See [Supported asset
        #     types](https://cloud.google.com/asset-inventory/docs/supported-asset-types)
        #     for more information.
        # @!attribute [rw] resource
        #   @return [::Google::Cloud::Asset::V1::Resource]
        #     A representation of the resource.
        # @!attribute [rw] iam_policy
        #   @return [::Google::Iam::V1::Policy]
        #     A representation of the Cloud IAM policy set on a Google Cloud resource.
        #     There can be a maximum of one Cloud IAM policy set on any given resource.
        #     In addition, Cloud IAM policies inherit their granted access scope from any
        #     policies set on parent resources in the resource hierarchy. Therefore, the
        #     effectively policy is the union of both the policy set on this resource
        #     and each policy set on all of the resource's ancestry resource levels in
        #     the hierarchy. See
        #     [this topic](https://cloud.google.com/iam/docs/policies#inheritance) for
        #     more information.
        # @!attribute [rw] org_policy
        #   @return [::Array<::Google::Cloud::OrgPolicy::V1::Policy>]
        #     A representation of an [organization
        #     policy](https://cloud.google.com/resource-manager/docs/organization-policy/overview#organization_policy).
        #     There can be more than one organization policy with different constraints
        #     set on a given resource.
        # @!attribute [rw] access_policy
        #   @return [::Google::Identity::AccessContextManager::V1::AccessPolicy]
        # @!attribute [rw] access_level
        #   @return [::Google::Identity::AccessContextManager::V1::AccessLevel]
        # @!attribute [rw] service_perimeter
        #   @return [::Google::Identity::AccessContextManager::V1::ServicePerimeter]
        # @!attribute [rw] ancestors
        #   @return [::Array<::String>]
        #     The ancestry path of an asset in Google Cloud [resource
        #     hierarchy](https://cloud.google.com/resource-manager/docs/cloud-platform-resource-hierarchy),
        #     represented as a list of relative resource names. An ancestry path starts
        #     with the closest ancestor in the hierarchy and ends at root. If the asset
        #     is a project, folder, or organization, the ancestry path starts from the
        #     asset itself.
        #
        #     For example: `["projects/123456789", "folders/5432", "organizations/1234"]`
        class Asset
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # A representation of a Google Cloud resource.
        # @!attribute [rw] version
        #   @return [::String]
        #     The API version. For example: `v1`
        # @!attribute [rw] discovery_document_uri
        #   @return [::String]
        #     The URL of the discovery document containing the resource's JSON schema.
        #     For example:
        #     `https://www.googleapis.com/discovery/v1/apis/compute/v1/rest`
        #
        #     This value is unspecified for resources that do not have an API based on a
        #     discovery document, such as Cloud Bigtable.
        # @!attribute [rw] discovery_name
        #   @return [::String]
        #     The JSON schema name listed in the discovery document. For example:
        #     `Project`
        #
        #     This value is unspecified for resources that do not have an API based on a
        #     discovery document, such as Cloud Bigtable.
        # @!attribute [rw] resource_url
        #   @return [::String]
        #     The REST URL for accessing the resource. An HTTP `GET` request using this
        #     URL returns the resource itself. For example:
        #     `https://cloudresourcemanager.googleapis.com/v1/projects/my-project-123`
        #
        #     This value is unspecified for resources without a REST API.
        # @!attribute [rw] parent
        #   @return [::String]
        #     The full name of the immediate parent of this resource. See
        #     [Resource
        #     Names](https://cloud.google.com/apis/design/resource_names#full_resource_name)
        #     for more information.
        #
        #     For Google Cloud assets, this value is the parent resource defined in the
        #     [Cloud IAM policy
        #     hierarchy](https://cloud.google.com/iam/docs/overview#policy_hierarchy).
        #     For example:
        #     `//cloudresourcemanager.googleapis.com/projects/my_project_123`
        #
        #     For third-party assets, this field may be set differently.
        # @!attribute [rw] data
        #   @return [::Google::Protobuf::Struct]
        #     The content of the resource, in which some sensitive fields are removed
        #     and may not be present.
        # @!attribute [rw] location
        #   @return [::String]
        #     The location of the resource in Google Cloud, such as its zone and region.
        #     For more information, see https://cloud.google.com/about/locations/.
        class Resource
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods
        end

        # A result of Resource Search, containing information of a cloud resoure.
        # @!attribute [rw] name
        #   @return [::String]
        #     The full resource name of this resource. Example:
        #     `//compute.googleapis.com/projects/my_project_123/zones/zone1/instances/instance1`.
        #     See [Cloud Asset Inventory Resource Name
        #     Format](https://cloud.google.com/asset-inventory/docs/resource-name-format)
        #     for more information.
        #
        #     To search against the `name`:
        #
        #     * use a field query. Example: `name : "instance1"`
        #     * use a free text query. Example: `"instance1"`
        # @!attribute [rw] asset_type
        #   @return [::String]
        #     The type of this resource. Example: `compute.googleapis.com/Disk`.
        #
        #     To search against the `asset_type`:
        #
        #     * specify the `asset_type` field in your search request.
        # @!attribute [rw] project
        #   @return [::String]
        #     The project that this resource belongs to, in the form of
        #     projects/\\{PROJECT_NUMBER}.
        #
        #     To search against the `project`:
        #
        #     * specify the `scope` field as this project in your search request.
        # @!attribute [rw] display_name
        #   @return [::String]
        #     The display name of this resource.
        #
        #     To search against the `display_name`:
        #
        #     * use a field query. Example: `displayName : "My Instance"`
        #     * use a free text query. Example: `"My Instance"`
        # @!attribute [rw] description
        #   @return [::String]
        #     One or more paragraphs of text description of this resource. Maximum length
        #     could be up to 1M bytes.
        #
        #     To search against the `description`:
        #
        #     * use a field query. Example: `description : "*important instance*"`
        #     * use a free text query. Example: `"*important instance*"`
        # @!attribute [rw] location
        #   @return [::String]
        #     Location can be `global`, regional like `us-east1`, or zonal like
        #     `us-west1-b`.
        #
        #     To search against the `location`:
        #
        #     * use a field query. Example: `location : "us-west*"`
        #     * use a free text query. Example: `"us-west*"`
        # @!attribute [rw] labels
        #   @return [::Google::Protobuf::Map{::String => ::String}]
        #     Labels associated with this resource. See [Labelling and grouping GCP
        #     resources](https://cloud.google.com/blog/products/gcp/labelling-and-grouping-your-google-cloud-platform-resources)
        #     for more information.
        #
        #     To search against the `labels`:
        #
        #     * use a field query, as following:
        #         - query on any label's key or value. Example: `labels : "prod"`
        #         - query by a given label. Example: `labels.env : "prod"`
        #         - query by a given label'sexistence. Example: `labels.env : *`
        #     * use a free text query. Example: `"prod"`
        # @!attribute [rw] network_tags
        #   @return [::Array<::String>]
        #     Network tags associated with this resource. Like labels, network tags are a
        #     type of annotations used to group GCP resources. See [Labelling GCP
        #     resources](https://cloud.google.com/blog/products/gcp/labelling-and-grouping-your-google-cloud-platform-resources)
        #     for more information.
        #
        #     To search against the `network_tags`:
        #
        #     * use a field query. Example: `networkTags : "internal"`
        #     * use a free text query. Example: `"internal"`
        # @!attribute [rw] additional_attributes
        #   @return [::Google::Protobuf::Struct]
        #     The additional attributes of this resource. The attributes may vary from
        #     one resource type to another. Examples: `projectId` for Project,
        #     `dnsName` for DNS ManagedZone.
        #
        #     To search against the `additional_attributes`:
        #
        #     * use a free text query to match the attributes values. Example: to search
        #       `additional_attributes = { dnsName: "foobar" }`, you can issue a query
        #       `"foobar"`.
        class ResourceSearchResult
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # @!attribute [rw] key
          #   @return [::String]
          # @!attribute [rw] value
          #   @return [::String]
          class LabelsEntry
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods
          end
        end

        # A result of IAM Policy search, containing information of an IAM policy.
        # @!attribute [rw] resource
        #   @return [::String]
        #     The full resource name of the resource associated with this IAM policy.
        #     Example:
        #     `//compute.googleapis.com/projects/my_project_123/zones/zone1/instances/instance1`.
        #     See [Cloud Asset Inventory Resource Name
        #     Format](https://cloud.google.com/asset-inventory/docs/resource-name-format)
        #     for more information.
        #
        #     To search against the `resource`:
        #
        #     * use a field query. Example: `resource : "organizations/123"`
        # @!attribute [rw] project
        #   @return [::String]
        #     The project that the associated GCP resource belongs to, in the form of
        #     projects/\\{PROJECT_NUMBER}. If an IAM policy is set on a resource (like VM
        #     instance, Cloud Storage bucket), the project field will indicate the
        #     project that contains the resource. If an IAM policy is set on a folder or
        #     orgnization, the project field will be empty.
        #
        #     To search against the `project`:
        #
        #     * specify the `scope` field as this project in your search request.
        # @!attribute [rw] policy
        #   @return [::Google::Iam::V1::Policy]
        #     The IAM policy directly set on the given resource. Note that the original
        #     IAM policy can contain multiple bindings. This only contains the bindings
        #     that match the given query. For queries that don't contain a constrain on
        #     policies (e.g., an empty query), this contains all the bindings.
        #
        #     To search against the `policy` bindings:
        #
        #     * use a field query, as following:
        #         - query by the policy contained members. Example:
        #           `policy : "amy@gmail.com"`
        #         - query by the policy contained roles. Example:
        #           `policy : "roles/compute.admin"`
        #         - query by the policy contained roles' implied permissions. Example:
        #           `policy.role.permissions : "compute.instances.create"`
        # @!attribute [rw] explanation
        #   @return [::Google::Cloud::Asset::V1::IamPolicySearchResult::Explanation]
        #     Explanation about the IAM policy search result. It contains additional
        #     information to explain why the search result matches the query.
        class IamPolicySearchResult
          include ::Google::Protobuf::MessageExts
          extend ::Google::Protobuf::MessageExts::ClassMethods

          # Explanation about the IAM policy search result.
          # @!attribute [rw] matched_permissions
          #   @return [::Google::Protobuf::Map{::String => ::Google::Cloud::Asset::V1::IamPolicySearchResult::Explanation::Permissions}]
          #     The map from roles to their included permissions that match the
          #     permission query (i.e., a query containing `policy.role.permissions:`).
          #     Example: if query `policy.role.permissions : "compute.disk.get"`
          #     matches a policy binding that contains owner role, the
          #     matched_permissions will be `{"roles/owner": ["compute.disk.get"]}`. The
          #     roles can also be found in the returned `policy` bindings. Note that the
          #     map is populated only for requests with permission queries.
          class Explanation
            include ::Google::Protobuf::MessageExts
            extend ::Google::Protobuf::MessageExts::ClassMethods

            # IAM permissions
            # @!attribute [rw] permissions
            #   @return [::Array<::String>]
            #     A list of permissions. A sample permission string: `compute.disk.get`.
            class Permissions
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end

            # @!attribute [rw] key
            #   @return [::String]
            # @!attribute [rw] value
            #   @return [::Google::Cloud::Asset::V1::IamPolicySearchResult::Explanation::Permissions]
            class MatchedPermissionsEntry
              include ::Google::Protobuf::MessageExts
              extend ::Google::Protobuf::MessageExts::ClassMethods
            end
          end
        end
      end
    end
  end
end