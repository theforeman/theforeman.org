---
title: Annotated Requests
script: osmenu.js
---
# Repository Sync (default settings)
### Request # 1:  
 POST  /pulp/api/v2/repositories/scenario_test/actions/sync/

  Backend Service:
   pulp

  Description:
   

  

##### Request body

```json
{
  "override_config": {
    "num_threads": 4,
    "validate": true
  }
}
```


##### Response body

```json
{
  "spawned_tasks": [
    {
      "_href": "/pulp/api/v2/tasks/8b9c7591-4d1b-48b7-b37b-bce4fdc9c2fd/",
      "task_id": "8b9c7591-4d1b-48b7-b37b-bce4fdc9c2fd"
    }
  ],
  "result": null,
  "error": null
}
```
### Request # 2:  Poll Sync task
 GET  /pulp/api/v2/tasks/8b9c7591-4d1b-48b7-b37b-bce4fdc9c2fd/

  Backend Service:
   pulp

  Description:
   

  
  Total Requests for this URL: 32
  

##### Request body

  None


##### Response body

```json
{
  "exception": null,
  "task_type": "pulp.server.managers.repo.sync.sync",
  "_href": "/pulp/api/v2/tasks/8b9c7591-4d1b-48b7-b37b-bce4fdc9c2fd/",
  "task_id": "8b9c7591-4d1b-48b7-b37b-bce4fdc9c2fd",
  "tags": [
    "pulp:repository:scenario_test",
    "pulp:action:sync"
  ],
  "finish_time": "2017-03-30T21:16:05Z",
  "_ns": "task_status",
  "start_time": "2017-03-30T21:16:05Z",
  "traceback": null,
  "spawned_tasks": [
    {
      "_href": "/pulp/api/v2/tasks/0837f608-4696-449a-811f-70ddabe59025/",
      "task_id": "0837f608-4696-449a-811f-70ddabe59025"
    }
  ],
  "progress_report": {
    "yum_importer": {
      "content": {
        "items_total": 0,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": {
          "rpm_total": 0,
          "rpm_done": 0,
          "drpm_total": 0,
          "drpm_done": 0
        },
        "size_total": 0,
        "size_left": 0,
        "items_left": 0
      },
      "comps": {
        "state": "FINISHED"
      },
      "purge_duplicates": {
        "state": "FINISHED"
      },
      "distribution": {
        "items_total": 3,
        "state": "FINISHED",
        "error_details": [

        ],
        "items_left": 0
      },
      "errata": {
        "state": "FINISHED"
      },
      "metadata": {
        "state": "FINISHED"
      }
    }
  },
  "queue": "reserved_resource_worker-1@dev.example.com.dq",
  "state": "finished",
  "worker_name": "reserved_resource_worker-1@dev.example.com",
  "result": {
    "result": "success",
    "importer_id": "yum_importer",
    "exception": null,
    "repo_id": "scenario_test",
    "traceback": null,
    "started": "2017-03-30T21:16:05Z",
    "_ns": "repo_sync_results",
    "completed": "2017-03-30T21:16:05Z",
    "importer_type_id": "yum_importer",
    "error_message": null,
    "summary": {
      "content": {
        "state": "FINISHED"
      },
      "comps": {
        "state": "FINISHED"
      },
      "purge_duplicates": {
        "state": "FINISHED"
      },
      "distribution": {
        "state": "FINISHED"
      },
      "errata": {
        "state": "FINISHED"
      },
      "metadata": {
        "state": "FINISHED"
      }
    },
    "added_count": 15,
    "removed_count": 0,
    "updated_count": 0,
    "id": "58dd7595418a8a0648b9bc52",
    "details": {
      "content": {
        "size_total": 0,
        "items_left": 0,
        "items_total": 0,
        "state": "FINISHED",
        "size_left": 0,
        "details": {
          "rpm_total": 0,
          "rpm_done": 0,
          "drpm_total": 0,
          "drpm_done": 0
        },
        "error_details": [

        ]
      },
      "comps": {
        "state": "FINISHED"
      },
      "purge_duplicates": {
        "state": "FINISHED"
      },
      "distribution": {
        "items_total": 3,
        "state": "FINISHED",
        "error_details": [

        ],
        "items_left": 0
      },
      "errata": {
        "state": "FINISHED"
      },
      "metadata": {
        "state": "FINISHED"
      }
    }
  },
  "error": null,
  "_id": {
    "$oid": "58dd7594e6919db96421ea13"
  },
  "id": "58dd7594e6919db96421ea13"
}
```
### Request # 3:  Poll Publish task
 GET  /pulp/api/v2/tasks/0837f608-4696-449a-811f-70ddabe59025/

  Backend Service:
   pulp

  Description:
   

  
  Total Requests for this URL: 12
  

##### Request body

  None


##### Response body

```json
{
  "exception": null,
  "task_type": "pulp.server.managers.repo.publish.publish",
  "_href": "/pulp/api/v2/tasks/0837f608-4696-449a-811f-70ddabe59025/",
  "task_id": "0837f608-4696-449a-811f-70ddabe59025",
  "tags": [
    "pulp:repository:scenario_test",
    "pulp:action:publish"
  ],
  "finish_time": "2017-03-30T21:16:05Z",
  "_ns": "task_status",
  "start_time": "2017-03-30T21:16:05Z",
  "traceback": null,
  "spawned_tasks": [

  ],
  "progress_report": {
    "scenario_test": [
      {
        "num_success": 1,
        "description": "Copying files",
        "step_type": "save_tar",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "8fa5d08e-3473-4127-80f6-223bee0a0409",
        "num_processed": 1
      },
      {
        "num_success": 1,
        "description": "Initializing repo metadata",
        "step_type": "initialize_repo_metadata",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "32cee4d1-6e51-419a-9833-5f2c88e3efd9",
        "num_processed": 1
      },
      {
        "num_success": 1,
        "description": "Publishing Distribution files",
        "step_type": "distribution",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "d62a1815-acd5-439c-b511-dcbd69edade4",
        "num_processed": 1
      },
      {
        "num_success": 8,
        "description": "Publishing RPMs",
        "step_type": "rpms",
        "items_total": 8,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "197b0894-07fd-470b-8bb4-5a55b9713d18",
        "num_processed": 8
      },
      {
        "num_success": 0,
        "description": "Publishing Delta RPMs",
        "step_type": "drpms",
        "items_total": 1,
        "state": "SKIPPED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "54795382-de70-4de3-a8ce-5f726b8f9cb2",
        "num_processed": 0
      },
      {
        "num_success": 3,
        "description": "Publishing Errata",
        "step_type": "errata",
        "items_total": 3,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "1996449c-9471-4988-b3ee-b7ceae0c6b41",
        "num_processed": 3
      },
      {
        "num_success": 3,
        "description": "Publishing Comps file",
        "step_type": "comps",
        "items_total": 3,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "f12472f5-4012-4112-afe0-49f57348e569",
        "num_processed": 3
      },
      {
        "num_success": 0,
        "description": "Publishing Metadata.",
        "step_type": "metadata",
        "items_total": 0,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "31efb1ef-a413-48be-99f2-7f4788a1cebd",
        "num_processed": 0
      },
      {
        "num_success": 1,
        "description": "Closing repo metadata",
        "step_type": "close_repo_metadata",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "22b9313d-ffae-49e3-8027-c86ef68f34de",
        "num_processed": 1
      },
      {
        "num_success": 0,
        "description": "Generating sqlite files",
        "step_type": "generate sqlite",
        "items_total": 1,
        "state": "SKIPPED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "fbc75485-e400-4cfa-bfa7-693edd8a832c",
        "num_processed": 0
      },
      {
        "num_success": 0,
        "description": "Generating HTML files",
        "step_type": "repoview",
        "items_total": 1,
        "state": "SKIPPED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "bf1215fe-c617-4481-894a-1ff1c7c7043b",
        "num_processed": 0
      },
      {
        "num_success": 1,
        "description": "Publishing files to web",
        "step_type": "publish_directory",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "605ae2e4-c443-4a5b-ba9f-f313d23c4822",
        "num_processed": 1
      },
      {
        "num_success": 1,
        "description": "Writing Listings File",
        "step_type": "initialize_repo_metadata",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "9fa215e9-b465-4f33-9ddd-e05c5a9e314d",
        "num_processed": 1
      }
    ]
  },
  "queue": "reserved_resource_worker-1@dev.example.com.dq",
  "state": "finished",
  "worker_name": "reserved_resource_worker-1@dev.example.com",
  "result": {
    "result": "success",
    "exception": null,
    "repo_id": "scenario_test",
    "started": "2017-03-30T21:16:05Z",
    "_ns": "repo_publish_results",
    "completed": "2017-03-30T21:16:05Z",
    "traceback": null,
    "distributor_type_id": "yum_distributor",
    "summary": {
      "generate sqlite": "SKIPPED",
      "initialize_repo_metadata": "FINISHED",
      "rpms": "FINISHED",
      "repoview": "SKIPPED",
      "close_repo_metadata": "FINISHED",
      "drpms": "SKIPPED",
      "comps": "FINISHED",
      "distribution": "FINISHED",
      "save_tar": "FINISHED",
      "publish_directory": "FINISHED",
      "errata": "FINISHED",
      "metadata": "FINISHED"
    },
    "error_message": null,
    "distributor_id": "scenario_test",
    "id": "58dd7595418a8a0648b9bc53",
    "details": [
      {
        "num_success": 1,
        "description": "Copying files",
        "step_type": "save_tar",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "8fa5d08e-3473-4127-80f6-223bee0a0409",
        "num_processed": 1
      },
      {
        "num_success": 1,
        "description": "Initializing repo metadata",
        "step_type": "initialize_repo_metadata",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "32cee4d1-6e51-419a-9833-5f2c88e3efd9",
        "num_processed": 1
      },
      {
        "num_success": 1,
        "description": "Publishing Distribution files",
        "step_type": "distribution",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "d62a1815-acd5-439c-b511-dcbd69edade4",
        "num_processed": 1
      },
      {
        "num_success": 8,
        "description": "Publishing RPMs",
        "step_type": "rpms",
        "items_total": 8,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "197b0894-07fd-470b-8bb4-5a55b9713d18",
        "num_processed": 8
      },
      {
        "num_success": 0,
        "description": "Publishing Delta RPMs",
        "step_type": "drpms",
        "items_total": 1,
        "state": "SKIPPED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "54795382-de70-4de3-a8ce-5f726b8f9cb2",
        "num_processed": 0
      },
      {
        "num_success": 3,
        "description": "Publishing Errata",
        "step_type": "errata",
        "items_total": 3,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "1996449c-9471-4988-b3ee-b7ceae0c6b41",
        "num_processed": 3
      },
      {
        "num_success": 3,
        "description": "Publishing Comps file",
        "step_type": "comps",
        "items_total": 3,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "f12472f5-4012-4112-afe0-49f57348e569",
        "num_processed": 3
      },
      {
        "num_success": 0,
        "description": "Publishing Metadata.",
        "step_type": "metadata",
        "items_total": 0,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "31efb1ef-a413-48be-99f2-7f4788a1cebd",
        "num_processed": 0
      },
      {
        "num_success": 1,
        "description": "Closing repo metadata",
        "step_type": "close_repo_metadata",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "22b9313d-ffae-49e3-8027-c86ef68f34de",
        "num_processed": 1
      },
      {
        "num_success": 0,
        "description": "Generating sqlite files",
        "step_type": "generate sqlite",
        "items_total": 1,
        "state": "SKIPPED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "fbc75485-e400-4cfa-bfa7-693edd8a832c",
        "num_processed": 0
      },
      {
        "num_success": 0,
        "description": "Generating HTML files",
        "step_type": "repoview",
        "items_total": 1,
        "state": "SKIPPED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "bf1215fe-c617-4481-894a-1ff1c7c7043b",
        "num_processed": 0
      },
      {
        "num_success": 1,
        "description": "Publishing files to web",
        "step_type": "publish_directory",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "605ae2e4-c443-4a5b-ba9f-f313d23c4822",
        "num_processed": 1
      },
      {
        "num_success": 1,
        "description": "Writing Listings File",
        "step_type": "initialize_repo_metadata",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "9fa215e9-b465-4f33-9ddd-e05c5a9e314d",
        "num_processed": 1
      }
    ]
  },
  "error": null,
  "_id": {
    "$oid": "58dd7595e6919db96421ea23"
  },
  "id": "58dd7595e6919db96421ea23"
}
```
### Request # 4:  Distribution Search
 POST  /pulp/api/v2/repositories/scenario_test/search/units/

  Backend Service:
   pulp

  Description:
   Search for distribution information with all fields

  

##### Request body

```json
{
  "criteria": {
    "type_ids": [
      "distribution"
    ]
  }
}
```


##### Response body

```json
[
  {
    "metadata": {
      "files": [
        {
          "relativepath": "images/test2.img",
          "checksumtype": "sha256",
          "checksum": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        },
        {
          "relativepath": "empty.iso",
          "checksumtype": "sha256",
          "checksum": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        },
        {
          "relativepath": "images/test1.img",
          "checksumtype": "sha256",
          "checksum": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      ],
      "_storage_path": "/var/lib/pulp/content/units/distribution/9b/831256a124718bf39166b564d8e689954ff0a8f0f479ba24cfa26350109bc5",
      "family": "Test Family",
      "downloaded": true,
      "timestamp": 1323112153.09,
      "_last_updated": 1490908565,
      "_content_type_id": "distribution",
      "variant": "TestVariant",
      "id": "ks-Test Family-TestVariant-16-x86_64",
      "version": "16",
      "version_sort_index": "02-16",
      "pulp_user_metadata": {
      },
      "packagedir": "",
      "_id": "be1ea9b9-518c-4c05-ab97-3d6102482158",
      "arch": "x86_64",
      "_ns": "units_distribution"
    },
    "updated": "2017-03-30T21:16:05Z",
    "repo_id": "scenario_test",
    "created": "2017-03-30T21:16:05Z",
    "unit_type_id": "distribution",
    "unit_id": "be1ea9b9-518c-4c05-ab97-3d6102482158",
    "_id": {
      "$oid": "58dd7595e6919db96421ea1c"
    }
  }
]
```
### Request # 5:  Fetch rpm unit ids for this repo
 POST  /pulp/api/v2/repositories/scenario_test/search/units/

  Backend Service:
   pulp

  Description:
   

  

##### Request body

```json
{
  "criteria": {
    "type_ids": [
      "rpm"
    ],
    "fields": {
      "unit": [

      ],
      "association": [
        "unit_id"
      ]
    }
  }
}
```


##### Response body

```json
[
  {
    "metadata": {
      "_id": "085babbb-3a43-4b9c-bdfb-915fd78c7bec",
      "_content_type_id": "rpm"
    },
    "_id": {
      "$oid": "58dd7595e6919db96421ea1a"
    },
    "unit_id": "085babbb-3a43-4b9c-bdfb-915fd78c7bec",
    "unit_type_id": "rpm"
  },
  {
    "metadata": {
      "_id": "2b00d383-f2c7-462c-bfe3-25a008caa0fe",
      "_content_type_id": "rpm"
    },
    "_id": {
      "$oid": "58dd7595e6919db96421ea18"
    },
    "unit_id": "2b00d383-f2c7-462c-bfe3-25a008caa0fe",
    "unit_type_id": "rpm"
  },
  {
    "metadata": {
      "_id": "5ee1ec3a-7f81-47e6-bbba-11b443251f29",
      "_content_type_id": "rpm"
    },
    "_id": {
      "$oid": "58dd7595e6919db96421ea15"
    },
    "unit_id": "5ee1ec3a-7f81-47e6-bbba-11b443251f29",
    "unit_type_id": "rpm"
  },
  {
    "metadata": {
      "_id": "6b8e6197-c155-4c8c-a931-aa5b85bd218c",
      "_content_type_id": "rpm"
    },
    "_id": {
      "$oid": "58dd7595e6919db96421ea17"
    },
    "unit_id": "6b8e6197-c155-4c8c-a931-aa5b85bd218c",
    "unit_type_id": "rpm"
  },
  {
    "metadata": {
      "_id": "7ff4f862-7ae7-4b20-b072-0d154a9cc527",
      "_content_type_id": "rpm"
    },
    "_id": {
      "$oid": "58dd7595e6919db96421ea16"
    },
    "unit_id": "7ff4f862-7ae7-4b20-b072-0d154a9cc527",
    "unit_type_id": "rpm"
  },
  {
    "metadata": {
      "_id": "9f6b8fda-dd97-453e-8841-093d05c8eac3",
      "_content_type_id": "rpm"
    },
    "_id": {
      "$oid": "58dd7595e6919db96421ea19"
    },
    "unit_id": "9f6b8fda-dd97-453e-8841-093d05c8eac3",
    "unit_type_id": "rpm"
  },
  {
    "metadata": {
      "_id": "d35640a0-8613-44bd-9e99-141af2843087",
      "_content_type_id": "rpm"
    },
    "_id": {
      "$oid": "58dd7595e6919db96421ea14"
    },
    "unit_id": "d35640a0-8613-44bd-9e99-141af2843087",
    "unit_type_id": "rpm"
  },
  {
    "metadata": {
      "_id": "f521f967-a646-436e-ba83-1ac9ef8f7cd8",
      "_content_type_id": "rpm"
    },
    "_id": {
      "$oid": "58dd7595e6919db96421ea1b"
    },
    "unit_id": "f521f967-a646-436e-ba83-1ac9ef8f7cd8",
    "unit_type_id": "rpm"
  }
]
```
### Request # 6:  Fetch rpm units for this repository
 POST  /pulp/api/v2/content/units/rpm/search/

  Backend Service:
   pulp

  Description:
   Search for all rpms with the previously fetched ids.  We do this because historically we've wanted the list of all repo ids for each unit, which is only available via this endpoint.

  

##### Request body

```json
{
  "criteria": {
    "limit": 8,
    "skip": 0,
    "fields": [
      "name",
      "version",
      "release",
      "arch",
      "epoch",
      "summary",
      "sourcerpm",
      "checksum",
      "filename",
      "_id"
    ],
    "filters": {
      "_id": {
        "$in": [
          "085babbb-3a43-4b9c-bdfb-915fd78c7bec",
          "2b00d383-f2c7-462c-bfe3-25a008caa0fe",
          "5ee1ec3a-7f81-47e6-bbba-11b443251f29",
          "6b8e6197-c155-4c8c-a931-aa5b85bd218c",
          "7ff4f862-7ae7-4b20-b072-0d154a9cc527",
          "9f6b8fda-dd97-453e-8841-093d05c8eac3",
          "d35640a0-8613-44bd-9e99-141af2843087",
          "f521f967-a646-436e-ba83-1ac9ef8f7cd8"
        ]
      }
    }
  },
  "include_repos": true
}
```


##### Response body

```json
[
  {
    "repository_memberships": [
      "scenario_test"
    ],
    "sourcerpm": "walrus-0.3-0.8.src.rpm",
    "name": "walrus",
    "checksum": "6e8d6dc057e3e2c9819f0dc7e6c7b7f86bf2e8571bba414adec7fb621a461dfd",
    "summary": "A dummy package of walrus",
    "filename": "walrus-0.3-0.8.noarch.rpm",
    "epoch": "0",
    "version": "0.3",
    "release": "0.8",
    "_id": "085babbb-3a43-4b9c-bdfb-915fd78c7bec",
    "arch": "noarch",
    "children": {
    },
    "_href": "/pulp/api/v2/content/units/rpm/085babbb-3a43-4b9c-bdfb-915fd78c7bec/"
  },
  {
    "repository_memberships": [
      "scenario_test"
    ],
    "sourcerpm": "penguin-0.3-0.8.src.rpm",
    "name": "penguin",
    "checksum": "3fcb2c927de9e13bf68469032a28b139d3e5ad2e58564fc210fd6e48635be694",
    "summary": "A dummy package of penguin",
    "filename": "penguin-0.3-0.8.noarch.rpm",
    "epoch": "0",
    "version": "0.3",
    "release": "0.8",
    "_id": "2b00d383-f2c7-462c-bfe3-25a008caa0fe",
    "arch": "noarch",
    "children": {
    },
    "_href": "/pulp/api/v2/content/units/rpm/2b00d383-f2c7-462c-bfe3-25a008caa0fe/"
  },
  {
    "repository_memberships": [
      "scenario_test"
    ],
    "sourcerpm": "elephant-0.3-0.8.src.rpm",
    "name": "elephant",
    "checksum": "3e1c70cd1b421328acaf6397cb3d16145306bb95f65d1b095fc31372a0a701f3",
    "summary": "A dummy package of elephant",
    "filename": "elephant-0.3-0.8.noarch.rpm",
    "epoch": "0",
    "version": "0.3",
    "release": "0.8",
    "_id": "5ee1ec3a-7f81-47e6-bbba-11b443251f29",
    "arch": "noarch",
    "children": {
    },
    "_href": "/pulp/api/v2/content/units/rpm/5ee1ec3a-7f81-47e6-bbba-11b443251f29/"
  },
  {
    "repository_memberships": [
      "scenario_test"
    ],
    "sourcerpm": "monkey-0.3-0.8.src.rpm",
    "name": "monkey",
    "checksum": "0e8fa50d0128fbabc7ccc5632e3fa25d39b0280169f6166cb8e2c84de8501db1",
    "summary": "A dummy package of monkey",
    "filename": "monkey-0.3-0.8.noarch.rpm",
    "epoch": "0",
    "version": "0.3",
    "release": "0.8",
    "_id": "6b8e6197-c155-4c8c-a931-aa5b85bd218c",
    "arch": "noarch",
    "children": {
    },
    "_href": "/pulp/api/v2/content/units/rpm/6b8e6197-c155-4c8c-a931-aa5b85bd218c/"
  },
  {
    "repository_memberships": [
      "scenario_test"
    ],
    "sourcerpm": "lion-0.3-0.8.src.rpm",
    "name": "lion",
    "checksum": "12400dc95c23a4c160725a908716cd3fcdd7a8981585437ab64cd62efa3e4ae4",
    "summary": "A dummy package of lion",
    "filename": "lion-0.3-0.8.noarch.rpm",
    "epoch": "0",
    "version": "0.3",
    "release": "0.8",
    "_id": "7ff4f862-7ae7-4b20-b072-0d154a9cc527",
    "arch": "noarch",
    "children": {
    },
    "_href": "/pulp/api/v2/content/units/rpm/7ff4f862-7ae7-4b20-b072-0d154a9cc527/"
  },
  {
    "repository_memberships": [
      "scenario_test"
    ],
    "sourcerpm": "cheetah-0.3-0.8.src.rpm",
    "name": "cheetah",
    "checksum": "422d0baa0cd9d7713ae796e886a23e17f578f924f74880debdbb7d65fb368dae",
    "summary": "A dummy package of cheetah",
    "filename": "cheetah-0.3-0.8.noarch.rpm",
    "epoch": "0",
    "version": "0.3",
    "release": "0.8",
    "_id": "9f6b8fda-dd97-453e-8841-093d05c8eac3",
    "arch": "noarch",
    "children": {
    },
    "_href": "/pulp/api/v2/content/units/rpm/9f6b8fda-dd97-453e-8841-093d05c8eac3/"
  },
  {
    "repository_memberships": [
      "scenario_test"
    ],
    "sourcerpm": "giraffe-0.3-0.8.src.rpm",
    "name": "giraffe",
    "checksum": "f25d67d1d9da04f12e57ca323247b43891ac46533e355b82de6d1922009f9f14",
    "summary": "A dummy package of giraffe",
    "filename": "giraffe-0.3-0.8.noarch.rpm",
    "epoch": "0",
    "version": "0.3",
    "release": "0.8",
    "_id": "d35640a0-8613-44bd-9e99-141af2843087",
    "arch": "noarch",
    "children": {
    },
    "_href": "/pulp/api/v2/content/units/rpm/d35640a0-8613-44bd-9e99-141af2843087/"
  },
  {
    "repository_memberships": [
      "scenario_test"
    ],
    "sourcerpm": "squirrel-0.3-0.8.src.rpm",
    "name": "squirrel",
    "checksum": "251768bdd15f13d78487c27638aa6aecd01551e253756093cde1c0ae878a17d2",
    "summary": "A dummy package of squirrel",
    "filename": "squirrel-0.3-0.8.noarch.rpm",
    "epoch": "0",
    "version": "0.3",
    "release": "0.8",
    "_id": "f521f967-a646-436e-ba83-1ac9ef8f7cd8",
    "arch": "noarch",
    "children": {
    },
    "_href": "/pulp/api/v2/content/units/rpm/f521f967-a646-436e-ba83-1ac9ef8f7cd8/"
  }
]
```
### Request # 7:  Fetch Errata ids for repository
 POST  /pulp/api/v2/repositories/scenario_test/search/units/

  Backend Service:
   pulp

  Description:
   

  

##### Request body

```json
{
  "criteria": {
    "type_ids": [
      "erratum"
    ],
    "fields": {
      "unit": [

      ],
      "association": [
        "unit_id"
      ]
    }
  }
}
```


##### Response body

```json
[
  {
    "metadata": {
      "_id": "4b12197f-28b0-4d5c-bf8d-057dc0b378f1",
      "_content_type_id": "erratum"
    },
    "_id": {
      "$oid": "58dd7595e6919db96421ea1e"
    },
    "unit_id": "4b12197f-28b0-4d5c-bf8d-057dc0b378f1",
    "unit_type_id": "erratum"
  },
  {
    "metadata": {
      "_id": "5bc4a860-2872-461a-8061-b30626274615",
      "_content_type_id": "erratum"
    },
    "_id": {
      "$oid": "58dd7595e6919db96421ea1f"
    },
    "unit_id": "5bc4a860-2872-461a-8061-b30626274615",
    "unit_type_id": "erratum"
  },
  {
    "metadata": {
      "_id": "c12277ae-b619-40cc-afbc-75c92e78ca13",
      "_content_type_id": "erratum"
    },
    "_id": {
      "$oid": "58dd7595e6919db96421ea1d"
    },
    "unit_id": "c12277ae-b619-40cc-afbc-75c92e78ca13",
    "unit_type_id": "erratum"
  }
]
```
### Request # 8:  Fetch errata units.
 POST  /pulp/api/v2/content/units/erratum/search/

  Backend Service:
   pulp

  Description:
   Using the previously fetched ids, we fetch all errata in the repo.

  

##### Request body

```json
{
  "criteria": {
    "limit": 3,
    "skip": 0,
    "filters": {
      "_id": {
        "$in": [
          "4b12197f-28b0-4d5c-bf8d-057dc0b378f1",
          "5bc4a860-2872-461a-8061-b30626274615",
          "c12277ae-b619-40cc-afbc-75c92e78ca13"
        ]
      }
    }
  },
  "include_repos": true
}
```


##### Response body

```json
[
  {
    "repository_memberships": [
      "scenario_test"
    ],
    "_href": "/pulp/api/v2/content/units/erratum/4b12197f-28b0-4d5c-bf8d-057dc0b378f1/",
    "issued": "2010-11-10 00:00:00",
    "references": [
      {
        "href": "https://rhn.redhat.com/errata/RHSA-2010-0858.html",
        "type": "self",
        "id": null,
        "title": "RHSA-2010:0858"
      },
      {
        "href": "https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=627882",
        "type": "bugzilla",
        "id": "627882",
        "title": "CVE-2010-0405 bzip2: integer overflow flaw in BZ2_decompress"
      },
      {
        "href": "https://www.redhat.com/security/data/cve/CVE-2010-0405.html",
        "type": "cve",
        "id": "CVE-2010-0405",
        "title": "CVE-2010-0405"
      },
      {
        "href": "http://www.redhat.com/security/updates/classification/#important",
        "type": "other",
        "id": null,
        "title": null
      }
    ],
    "pulp_user_metadata": {
    },
    "_content_type_id": "erratum",
    "id": "RHSA-2010:0858",
    "from": "security@redhat.com",
    "severity": "Important",
    "title": "Important: bzip2 security update",
    "children": {
    },
    "version": "3",
    "reboot_suggested": false,
    "type": "security",
    "pkglist": [
      {
        "_pulp_repo_id": "scenario_test",
        "packages": [
          {
            "src": "bzip2-1.0.5-7.el6_0.src.rpm",
            "name": "bzip2-devel",
            "sum": [
              "sha256",
              "ea67c664da1ff96a6dc94d33009b73d8fab31b59824183fb45e9ba2ebf82d583"
            ],
            "filename": "bzip2-devel-1.0.5-7.el6_0.i686.rpm",
            "epoch": "0",
            "version": "1.0.5",
            "release": "7.el6_0",
            "arch": "i686"
          },
          {
            "src": "bzip2-1.0.5-7.el6_0.src.rpm",
            "name": "bzip2-libs",
            "sum": [
              "sha256",
              "c9f064a6862573fb9f2a6aff7c3621f1940b492df2edfc2ebbdc0b8305f51147"
            ],
            "filename": "bzip2-libs-1.0.5-7.el6_0.i686.rpm",
            "epoch": "0",
            "version": "1.0.5",
            "release": "7.el6_0",
            "arch": "i686"
          },
          {
            "src": "bzip2-1.0.5-7.el6_0.src.rpm",
            "name": "bzip2",
            "sum": [
              "sha256",
              "b8a3f72bc2b0d89ba737099ac98bf8d2af4bea02d31884c02db97f7f66c3d5c2"
            ],
            "filename": "bzip2-1.0.5-7.el6_0.x86_64.rpm",
            "epoch": "0",
            "version": "1.0.5",
            "release": "7.el6_0",
            "arch": "x86_64"
          },
          {
            "src": "bzip2-1.0.5-7.el6_0.src.rpm",
            "name": "bzip2-devel",
            "sum": [
              "sha256",
              "7f63124e4655b7c92d23ec4c38226f5d3746568853dff750fc85e058e74b5cf6"
            ],
            "filename": "bzip2-devel-1.0.5-7.el6_0.x86_64.rpm",
            "epoch": "0",
            "version": "1.0.5",
            "release": "7.el6_0",
            "arch": "x86_64"
          },
          {
            "src": "bzip2-1.0.5-7.el6_0.src.rpm",
            "name": "bzip2-libs",
            "sum": [
              "sha256",
              "802f4399dbdd01476e254c3b32c40aff59cf5d23a45fa488c6917ce8904d6b4d"
            ],
            "filename": "bzip2-libs-1.0.5-7.el6_0.x86_64.rpm",
            "epoch": "0",
            "version": "1.0.5",
            "release": "7.el6_0",
            "arch": "x86_64"
          }
        ],
        "name": "Red Hat Enterprise Linux Server (v. 6 for 64-bit x86_64)",
        "short": "rhel-x86_64-server-6"
      }
    ],
    "status": "final",
    "updated": "2010-11-10 00:00:00",
    "description": "bzip2 is a freely available, high-quality data compressor. It provides both\nlibbz2 library must be restarted for the update to take effect.",
    "_last_updated": "2017-03-30T21:16:05Z",
    "pushcount": "",
    "rights": "Copyright 2010 Red Hat Inc",
    "solution": "Before applying this update, make sure all previously-released errata\nrelevant to your system have been applied.\n\nThis update is available via the Red Hat Network. Details on how to\nuse the Red Hat Network to apply this update are available at\nhttp://kbase.redhat.com/faq/docs/DOC-11259",
    "summary": "Updated bzip2 packages that fix one security issue",
    "release": "",
    "_id": "4b12197f-28b0-4d5c-bf8d-057dc0b378f1"
  },
  {
    "repository_memberships": [
      "scenario_test"
    ],
    "_href": "/pulp/api/v2/content/units/erratum/5bc4a860-2872-461a-8061-b30626274615/",
    "issued": "2010-01-01 01:01:01",
    "references": [

    ],
    "pulp_user_metadata": {
    },
    "_content_type_id": "erratum",
    "id": "RHEA-2010:0002",
    "from": "lzap+pub@redhat.com",
    "severity": "",
    "title": "One package errata",
    "children": {
    },
    "version": "1",
    "reboot_suggested": false,
    "type": "security",
    "pkglist": [
      {
        "_pulp_repo_id": "scenario_test",
        "packages": [
          {
            "src": "http://www.fedoraproject.org",
            "name": "elephant",
            "sum": null,
            "filename": "elephant-0.3-0.8.noarch.rpm",
            "epoch": null,
            "version": "0.3",
            "release": "0.8",
            "arch": "noarch"
          }
        ],
        "name": "1",
        "short": ""
      }
    ],
    "status": "stable",
    "updated": "",
    "description": "One package errata",
    "_last_updated": "2017-03-30T21:16:05Z",
    "pushcount": "",
    "rights": "",
    "solution": "",
    "summary": "",
    "release": "1",
    "_id": "5bc4a860-2872-461a-8061-b30626274615"
  },
  {
    "repository_memberships": [
      "scenario_test"
    ],
    "_href": "/pulp/api/v2/content/units/erratum/c12277ae-b619-40cc-afbc-75c92e78ca13/",
    "issued": "2010-01-01 01:01:01",
    "references": [

    ],
    "pulp_user_metadata": {
    },
    "_content_type_id": "erratum",
    "id": "RHEA-2010:0001",
    "from": "lzap+pub@redhat.com",
    "severity": "",
    "title": "Empty errata",
    "children": {
    },
    "version": "1",
    "reboot_suggested": false,
    "type": "security",
    "pkglist": [

    ],
    "status": "stable",
    "updated": "",
    "description": "Empty errata",
    "_last_updated": "2017-03-30T21:16:05Z",
    "pushcount": "",
    "rights": "",
    "solution": "",
    "summary": "",
    "release": "1",
    "_id": "c12277ae-b619-40cc-afbc-75c92e78ca13"
  }
]
```
### Request # 9:  Fetch package group units for repository
 POST  /pulp/api/v2/repositories/scenario_test/search/units/

  Backend Service:
   pulp

  Description:
   

  

##### Request body

```json
{
  "criteria": {
    "type_ids": [
      "package_group"
    ],
    "fields": {
      "unit": [

      ],
      "association": [
        "unit_id"
      ]
    }
  }
}
```


##### Response body

```json
[
  {
    "metadata": {
      "_id": "919baa7e-e944-4602-b3ed-3aef2ae5b509",
      "_content_type_id": "package_group"
    },
    "_id": {
      "$oid": "58dd7595e6919db96421ea21"
    },
    "unit_id": "919baa7e-e944-4602-b3ed-3aef2ae5b509",
    "unit_type_id": "package_group"
  },
  {
    "metadata": {
      "_id": "c55b5b16-7501-4863-8e3f-f7520bc795fd",
      "_content_type_id": "package_group"
    },
    "_id": {
      "$oid": "58dd7595e6919db96421ea20"
    },
    "unit_id": "c55b5b16-7501-4863-8e3f-f7520bc795fd",
    "unit_type_id": "package_group"
  }
]
```
### Request # 10:  Fetch package group ids for repository
 POST  /pulp/api/v2/content/units/package_group/search/

  Backend Service:
   pulp

  Description:
   Using the previously fetched ids, we fetch all package groups in the repo.

  

##### Request body

```json
{
  "criteria": {
    "limit": 2,
    "skip": 0,
    "filters": {
      "_id": {
        "$in": [
          "919baa7e-e944-4602-b3ed-3aef2ae5b509",
          "c55b5b16-7501-4863-8e3f-f7520bc795fd"
        ]
      }
    }
  },
  "include_repos": true
}
```


##### Response body

```json
[
  {
    "repository_memberships": [
      "scenario_test"
    ],
    "mandatory_package_names": [
      "elephant,giraffe,cheetah,lion,monkey,penguin,squirrel,walrus",
      "penguin"
    ],
    "repo_id": "scenario_test",
    "name": "mammal",
    "user_visible": true,
    "default": true,
    "_last_updated": "2017-03-30T18:41:08Z",
    "children": {
    },
    "optional_package_names": [

    ],
    "translated_name": {
    },
    "_href": "/pulp/api/v2/content/units/package_group/919baa7e-e944-4602-b3ed-3aef2ae5b509/",
    "translated_description": {
    },
    "pulp_user_metadata": {
    },
    "default_package_names": [

    ],
    "_content_type_id": "package_group",
    "id": "mammal",
    "_id": "919baa7e-e944-4602-b3ed-3aef2ae5b509",
    "display_order": 1024,
    "conditional_package_names": [

    ]
  },
  {
    "repository_memberships": [
      "scenario_test"
    ],
    "mandatory_package_names": [
      "penguin"
    ],
    "repo_id": "scenario_test",
    "name": "bird",
    "user_visible": true,
    "default": true,
    "_last_updated": "2017-03-30T18:41:08Z",
    "children": {
    },
    "optional_package_names": [

    ],
    "translated_name": {
    },
    "_href": "/pulp/api/v2/content/units/package_group/c55b5b16-7501-4863-8e3f-f7520bc795fd/",
    "translated_description": {
    },
    "pulp_user_metadata": {
    },
    "default_package_names": [

    ],
    "_content_type_id": "package_group",
    "id": "bird",
    "_id": "c55b5b16-7501-4863-8e3f-f7520bc795fd",
    "display_order": 1024,
    "conditional_package_names": [

    ]
  }
]
```
### Request # 11:  Request applicability generation for consumers bound to the repository
 POST  /pulp/api/v2/repositories/actions/content/regenerate_applicability//

  Backend Service:
   pulp

  Description:
   

  

##### Request body

```json
{
  "parallel": true,
  "repo_criteria": {
    "filters": {
      "id": {
        "$in": [
          "scenario_test"
        ]
      }
    }
  }
}
```


##### Response body

```json
{
  "group_id": "b0e268a7-f4bf-4598-90a3-5fc3b562cc95",
  "_href": "/pulp/api/v2/task_groups/b0e268a7-f4bf-4598-90a3-5fc3b562cc95/"
}
```
### Request # 12:  Monitor task group status
 GET  /pulp/api/v2/task_groups/b0e268a7-f4bf-4598-90a3-5fc3b562cc95/state_summary/

  Backend Service:
   pulp

  Description:
   Monitor status of the applicability generation

  

##### Request body

  None


##### Response body

```json
{
  "accepted": 0,
  "finished": 0,
  "running": 0,
  "canceled": 0,
  "waiting": 0,
  "skipped": 0,
  "suspended": 0,
  "error": 0,
  "total": 0
}
```
### Request # 13:  Fetch repository details
 GET  /pulp/api/v2/repositories/scenario_test/

  Backend Service:
   pulp

  Description:
   Unclear why

  

##### Request body

  None


##### Response body

```json
{
  "scratchpad": {
    "checksum_type": "sha256"
  },
  "display_name": "Scenario yum product",
  "description": null,
  "distributors": [
    {
      "repo_id": "scenario_test",
      "last_updated": "2017-03-30T21:15:43Z",
      "_href": "/pulp/api/v2/repositories/scenario_test/distributors/scenario_test_clone/",
      "last_override_config": {
      },
      "last_publish": null,
      "distributor_type_id": "yum_clone_distributor",
      "auto_publish": false,
      "scratchpad": {
      },
      "_ns": "repo_distributors",
      "_id": {
        "$oid": "58dd757f418a8a04f88de7da"
      },
      "config": {
        "destination_distributor_id": "scenario_test"
      },
      "id": "scenario_test_clone"
    },
    {
      "repo_id": "scenario_test",
      "last_updated": "2017-03-30T21:16:05Z",
      "_href": "/pulp/api/v2/repositories/scenario_test/distributors/scenario_test/",
      "last_override_config": {
      },
      "last_publish": "2017-03-30T21:16:05Z",
      "distributor_type_id": "yum_distributor",
      "auto_publish": true,
      "scratchpad": {
      },
      "_ns": "repo_distributors",
      "_id": {
        "$oid": "58dd757f418a8a04f88de7d8"
      },
      "config": {
        "checksum_type": "sha256",
        "protected": true,
        "http": false,
        "https": true,
        "relative_url": "scenario_test"
      },
      "id": "scenario_test"
    },
    {
      "repo_id": "scenario_test",
      "last_updated": "2017-03-30T21:15:43Z",
      "_href": "/pulp/api/v2/repositories/scenario_test/distributors/export_distributor/",
      "last_override_config": {
      },
      "last_publish": null,
      "distributor_type_id": "export_distributor",
      "auto_publish": false,
      "scratchpad": {
      },
      "_ns": "repo_distributors",
      "_id": {
        "$oid": "58dd757f418a8a04f88de7d9"
      },
      "config": {
        "http": false,
        "relative_url": "scenario_test",
        "https": false
      },
      "id": "export_distributor"
    }
  ],
  "last_unit_added": "2017-03-30T21:16:05Z",
  "notes": {
    "_repo-type": "rpm-repo"
  },
  "last_unit_removed": null,
  "content_unit_counts": {
    "package_group": 2,
    "distribution": 1,
    "package_category": 1,
    "rpm": 8,
    "erratum": 3
  },
  "_ns": "repos",
  "importers": [
    {
      "repo_id": "scenario_test",
      "last_updated": "2017-03-30T21:15:43Z",
      "_href": "/pulp/api/v2/repositories/scenario_test/importers/yum_importer/",
      "_ns": "repo_importers",
      "importer_type_id": "yum_importer",
      "last_override_config": {
        "num_threads": 4,
        "validate": true
      },
      "last_sync": "2017-03-30T21:16:05Z",
      "scratchpad": {
        "repomd_revision": 1321893800
      },
      "_id": {
        "$oid": "58dd757f418a8a04f88de7d7"
      },
      "config": {
        "feed": "file:///var/www/test_repos/zoo",
        "ssl_validation": true,
        "remove_missing": true,
        "download_policy": "immediate"
      },
      "id": "yum_importer"
    }
  ],
  "locally_stored_units": 15,
  "_id": {
    "$oid": "58dd757f418a8a04f88de7d6"
  },
  "total_repository_units": 15,
  "id": "scenario_test",
  "_href": "/pulp/api/v2/repositories/scenario_test/"
}
```
# Repository Create
### Request # 1:  Create Content
 POST  /candlepin/owners/scenario_test/content/

  Backend Service:
   candlepin

  Description:
   Create Content object for repository, for subscription-manager content access

  

##### Request body

```json
{
  "name": "Scenario yum product",
  "contentUrl": "/custom/Scenario_Product/Scenario_yum_product",
  "type": "yum",
  "label": "scenario_test_Scenario_Product_Scenario_yum_product",
  "metadataExpire": 1,
  "vendor": "Custom"
}
```


##### Response body

```json
{
  "created": "2017-03-30T21:15:43+0000",
  "updated": "2017-03-30T21:15:43+0000",
  "uuid": "4028f9515b20f31e015b2112fba4000d",
  "id": "1490908543901",
  "type": "yum",
  "label": "scenario_test_Scenario_Product_Scenario_yum_product",
  "name": "Scenario yum product",
  "vendor": "Custom",
  "contentUrl": "/custom/Scenario_Product/Scenario_yum_product",
  "requiredTags": null,
  "gpgUrl": null,
  "metadataExpire": 1,
  "modifiedProductIds": [

  ],
  "arches": null,
  "releaseVer": null
}
```
### Request # 2:  Associate content object
 POST  /candlepin/owners/scenario_test/products/272869743822/content/1490908543901

  Backend Service:
   candlepin

  Description:
   Add the Content object to the product

  

##### Request body

  None


##### Response body

```json
{
  "created": "2017-03-30T21:15:42+0000",
  "updated": "2017-03-30T21:15:44+0000",
  "uuid": "4028f9515b20f31e015b2112fc03000e",
  "id": "272869743822",
  "name": "Scenario Product",
  "multiplier": 1,
  "attributes": [
    {
      "created": "2017-03-30T21:15:42+0000",
      "updated": "2017-03-30T21:15:44+0000",
      "name": "arch",
      "value": "ALL"
    }
  ],
  "dependentProductIds": [

  ],
  "href": "/products/4028f9515b20f31e015b2112fc03000e",
  "productContent": [
    {
      "content": {
        "created": "2017-03-30T21:15:43+0000",
        "updated": "2017-03-30T21:15:43+0000",
        "uuid": "4028f9515b20f31e015b2112fba4000d",
        "id": "1490908543901",
        "type": "yum",
        "label": "scenario_test_Scenario_Product_Scenario_yum_product",
        "name": "Scenario yum product",
        "vendor": "Custom",
        "contentUrl": "/custom/Scenario_Product/Scenario_yum_product",
        "requiredTags": null,
        "gpgUrl": null,
        "metadataExpire": 1,
        "modifiedProductIds": [

        ],
        "arches": null,
        "releaseVer": null
      },
      "enabled": true
    }
  ]
}
```
### Request # 3:  Retrieve candlepin environment
 GET  /candlepin/environments/119c4753ff6d3b7bd0b76de6d5a5f94a

  Backend Service:
   candlepin

  Description:
   Retrieve the environment object (TODO WHY?)

  

##### Request body

  None


##### Response body

```json
{
  "owner": {
    "id": "4028f9515b20f31e015b2112f2550004",
    "key": "scenario_test",
    "displayName": "scenario_test",
    "href": "/owners/scenario_test"
  },
  "name": "Library",
  "description": null,
  "id": "119c4753ff6d3b7bd0b76de6d5a5f94a",
  "environmentContent": [

  ],
  "created": "2017-03-30T21:15:41+0000",
  "updated": "2017-03-30T21:15:41+0000"
}
```
### Request # 4:  Create Pulp Repository
 POST  /pulp/api/v2/repositories/

  Backend Service:
   pulp

  Description:
   

  

##### Request body

```json
{
  "id": "scenario_test",
  "display_name": "Scenario yum product",
  "importer_type_id": "yum_importer",
  "importer_config": {
    "feed": "file:///var/www/test_repos/zoo",
    "ssl_ca_cert": null,
    "ssl_client_cert": null,
    "ssl_client_key": null,
    "ssl_validation": true,
    "download_policy": "immediate",
    "remove_missing": true
  },
  "notes": {
    "_repo-type": "rpm-repo"
  },
  "distributors": [
    {
      "distributor_type_id": "yum_distributor",
      "distributor_config": {
        "relative_url": "scenario_test",
        "http": false,
        "https": true,
        "protected": true
      },
      "auto_publish": true,
      "distributor_id": "scenario_test"
    },
    {
      "distributor_type_id": "export_distributor",
      "distributor_config": {
        "http": false,
        "https": false,
        "relative_url": "scenario_test"
      },
      "auto_publish": false,
      "distributor_id": "export_distributor"
    },
    {
      "distributor_type_id": "yum_clone_distributor",
      "distributor_config": {
        "destination_distributor_id": "scenario_test"
      },
      "auto_publish": false,
      "distributor_id": "scenario_test_clone"
    }
  ]
}
```


##### Response body

```json
{
  "scratchpad": {
  },
  "display_name": "Scenario yum product",
  "description": null,
  "last_unit_added": null,
  "notes": {
    "_repo-type": "rpm-repo"
  },
  "last_unit_removed": null,
  "content_unit_counts": {
  },
  "_ns": "repos",
  "_id": {
    "$oid": "58dd757f418a8a04f88de7d6"
  },
  "id": "scenario_test",
  "_href": "/pulp/api/v2/repositories/scenario_test/"
}
```
### Request # 5:  Add Content To environment
 POST  /candlepin/environments/119c4753ff6d3b7bd0b76de6d5a5f94a/content

  Backend Service:
   candlepin

  Description:
   Associates content object to "Library" environment, so it is accessible by clients registered to Library

  

##### Request body

```json
[
  {
    "contentId": "1490908543901"
  }
]
```


##### Response body

```json
{
  "id": "regen_entitlement_cert_of_envda871caa-8138-4edd-acc9-605195f992a4",
  "state": "CREATED",
  "startTime": null,
  "finishTime": null,
  "result": null,
  "principalName": "foreman_admin",
  "targetType": null,
  "targetId": null,
  "ownerId": null,
  "resultData": null,
  "statusPath": "/jobs/regen_entitlement_cert_of_envda871caa-8138-4edd-acc9-605195f992a4",
  "done": false,
  "group": "async group",
  "created": "2017-03-30T21:15:44+0000",
  "updated": "2017-03-30T21:15:44+0000"
}
```
### Request # 6:  Fetch repository information
 GET  /pulp/api/v2/repositories/scenario_test/

  Backend Service:
   pulp

  Description:
   

  

##### Request body

  None


##### Response body

```json
{
  "scratchpad": {
  },
  "display_name": "Scenario yum product",
  "description": null,
  "distributors": [
    {
      "repo_id": "scenario_test",
      "last_updated": "2017-03-30T21:15:43Z",
      "_href": "/pulp/api/v2/repositories/scenario_test/distributors/scenario_test_clone/",
      "last_override_config": {
      },
      "last_publish": null,
      "distributor_type_id": "yum_clone_distributor",
      "auto_publish": false,
      "scratchpad": {
      },
      "_ns": "repo_distributors",
      "_id": {
        "$oid": "58dd757f418a8a04f88de7da"
      },
      "config": {
        "destination_distributor_id": "scenario_test"
      },
      "id": "scenario_test_clone"
    },
    {
      "repo_id": "scenario_test",
      "last_updated": "2017-03-30T21:15:43Z",
      "_href": "/pulp/api/v2/repositories/scenario_test/distributors/scenario_test/",
      "last_override_config": {
      },
      "last_publish": null,
      "distributor_type_id": "yum_distributor",
      "auto_publish": true,
      "scratchpad": {
      },
      "_ns": "repo_distributors",
      "_id": {
        "$oid": "58dd757f418a8a04f88de7d8"
      },
      "config": {
        "protected": true,
        "http": false,
        "https": true,
        "relative_url": "scenario_test"
      },
      "id": "scenario_test"
    },
    {
      "repo_id": "scenario_test",
      "last_updated": "2017-03-30T21:15:43Z",
      "_href": "/pulp/api/v2/repositories/scenario_test/distributors/export_distributor/",
      "last_override_config": {
      },
      "last_publish": null,
      "distributor_type_id": "export_distributor",
      "auto_publish": false,
      "scratchpad": {
      },
      "_ns": "repo_distributors",
      "_id": {
        "$oid": "58dd757f418a8a04f88de7d9"
      },
      "config": {
        "http": false,
        "relative_url": "scenario_test",
        "https": false
      },
      "id": "export_distributor"
    }
  ],
  "last_unit_added": null,
  "notes": {
    "_repo-type": "rpm-repo"
  },
  "last_unit_removed": null,
  "content_unit_counts": {
  },
  "_ns": "repos",
  "importers": [
    {
      "repo_id": "scenario_test",
      "last_updated": "2017-03-30T21:15:43Z",
      "_href": "/pulp/api/v2/repositories/scenario_test/importers/yum_importer/",
      "_ns": "repo_importers",
      "importer_type_id": "yum_importer",
      "last_override_config": {
      },
      "last_sync": null,
      "scratchpad": null,
      "_id": {
        "$oid": "58dd757f418a8a04f88de7d7"
      },
      "config": {
        "feed": "file:///var/www/test_repos/zoo",
        "ssl_validation": true,
        "remove_missing": true,
        "download_policy": "immediate"
      },
      "id": "yum_importer"
    }
  ],
  "locally_stored_units": 0,
  "_id": {
    "$oid": "58dd757f418a8a04f88de7d6"
  },
  "total_repository_units": 0,
  "id": "scenario_test",
  "_href": "/pulp/api/v2/repositories/scenario_test/"
}
```
### Request # 7:  Publish repository metadata
 POST  /pulp/api/v2/repositories/scenario_test/actions/publish/

  Backend Service:
   pulp

  Description:
   Publish the repository, generating empty metadata so that existing clients of that product do not get a 404.

  

##### Request body

```json
{
  "id": "scenario_test",
  "override_config": {
    "force_full": false
  }
}
```


##### Response body

```json
{
  "spawned_tasks": [
    {
      "_href": "/pulp/api/v2/tasks/dfdb7cae-e465-4885-b3a4-7bb29343b69e/",
      "task_id": "dfdb7cae-e465-4885-b3a4-7bb29343b69e"
    }
  ],
  "result": null,
  "error": null
}
```
### Request # 8:  Poll Task
 GET  /pulp/api/v2/tasks/dfdb7cae-e465-4885-b3a4-7bb29343b69e/

  Backend Service:
   pulp

  Description:
   Monitor the task status of the publish

  
  Total Requests for this URL: 6
  

##### Request body

  None


##### Response body

```json
{
  "exception": null,
  "task_type": "pulp.server.managers.repo.publish.publish",
  "_href": "/pulp/api/v2/tasks/dfdb7cae-e465-4885-b3a4-7bb29343b69e/",
  "task_id": "dfdb7cae-e465-4885-b3a4-7bb29343b69e",
  "tags": [
    "pulp:repository:scenario_test",
    "pulp:action:publish"
  ],
  "finish_time": "2017-03-30T21:15:44Z",
  "_ns": "task_status",
  "start_time": "2017-03-30T21:15:44Z",
  "traceback": null,
  "spawned_tasks": [

  ],
  "progress_report": {
    "scenario_test": [
      {
        "num_success": 1,
        "description": "Initializing repo metadata",
        "step_type": "initialize_repo_metadata",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "e3a30d24-1111-4080-92f8-0a3dc979ae9c",
        "num_processed": 1
      },
      {
        "num_success": 0,
        "description": "Publishing Distribution files",
        "step_type": "distribution",
        "items_total": 0,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "c2edbc90-716d-4570-a442-bd0c22748f88",
        "num_processed": 0
      },
      {
        "num_success": 0,
        "description": "Publishing RPMs",
        "step_type": "rpms",
        "items_total": 0,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "bfea7f15-21d9-4cf0-af2a-5cce0c1c172b",
        "num_processed": 0
      },
      {
        "num_success": 0,
        "description": "Publishing Delta RPMs",
        "step_type": "drpms",
        "items_total": 1,
        "state": "SKIPPED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "47621356-70b3-4e77-a8f2-ee1ec0c5c2ee",
        "num_processed": 0
      },
      {
        "num_success": 0,
        "description": "Publishing Errata",
        "step_type": "errata",
        "items_total": 0,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "8e46b5e2-89f5-4ef5-80bd-0d2aab9dd2a0",
        "num_processed": 0
      },
      {
        "num_success": 0,
        "description": "Publishing Comps file",
        "step_type": "comps",
        "items_total": 0,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "050aba89-abec-4949-b3cf-28409d9519e0",
        "num_processed": 0
      },
      {
        "num_success": 0,
        "description": "Publishing Metadata.",
        "step_type": "metadata",
        "items_total": 0,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "70efd383-905d-4fe2-8c9b-4e18311e76d5",
        "num_processed": 0
      },
      {
        "num_success": 1,
        "description": "Closing repo metadata",
        "step_type": "close_repo_metadata",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "e3ae5910-8f8d-4e53-abd6-007a9495e0b4",
        "num_processed": 1
      },
      {
        "num_success": 0,
        "description": "Generating sqlite files",
        "step_type": "generate sqlite",
        "items_total": 1,
        "state": "SKIPPED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "ae023865-a176-4434-b8ab-77a080306602",
        "num_processed": 0
      },
      {
        "num_success": 0,
        "description": "Generating HTML files",
        "step_type": "repoview",
        "items_total": 1,
        "state": "SKIPPED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "4d7ca329-7b33-478e-a0a5-777771d8c7c6",
        "num_processed": 0
      },
      {
        "num_success": 1,
        "description": "Publishing files to web",
        "step_type": "publish_directory",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "0989644f-85dc-43ff-9e0f-10c814a8d5e8",
        "num_processed": 1
      },
      {
        "num_success": 1,
        "description": "Writing Listings File",
        "step_type": "initialize_repo_metadata",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "04b588ee-11fe-4b09-8a42-2ea465247c0b",
        "num_processed": 1
      }
    ]
  },
  "queue": "reserved_resource_worker-1@dev.example.com.dq",
  "state": "finished",
  "worker_name": "reserved_resource_worker-1@dev.example.com",
  "result": {
    "result": "success",
    "exception": null,
    "repo_id": "scenario_test",
    "started": "2017-03-30T21:15:44Z",
    "_ns": "repo_publish_results",
    "completed": "2017-03-30T21:15:44Z",
    "traceback": null,
    "distributor_type_id": "yum_distributor",
    "summary": {
      "generate sqlite": "SKIPPED",
      "initialize_repo_metadata": "FINISHED",
      "rpms": "FINISHED",
      "close_repo_metadata": "FINISHED",
      "drpms": "SKIPPED",
      "comps": "FINISHED",
      "distribution": "FINISHED",
      "repoview": "SKIPPED",
      "publish_directory": "FINISHED",
      "errata": "FINISHED",
      "metadata": "FINISHED"
    },
    "error_message": null,
    "distributor_id": "scenario_test",
    "id": "58dd7580418a8a0648b9bc40",
    "details": [
      {
        "num_success": 1,
        "description": "Initializing repo metadata",
        "step_type": "initialize_repo_metadata",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "e3a30d24-1111-4080-92f8-0a3dc979ae9c",
        "num_processed": 1
      },
      {
        "num_success": 0,
        "description": "Publishing Distribution files",
        "step_type": "distribution",
        "items_total": 0,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "c2edbc90-716d-4570-a442-bd0c22748f88",
        "num_processed": 0
      },
      {
        "num_success": 0,
        "description": "Publishing RPMs",
        "step_type": "rpms",
        "items_total": 0,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "bfea7f15-21d9-4cf0-af2a-5cce0c1c172b",
        "num_processed": 0
      },
      {
        "num_success": 0,
        "description": "Publishing Delta RPMs",
        "step_type": "drpms",
        "items_total": 1,
        "state": "SKIPPED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "47621356-70b3-4e77-a8f2-ee1ec0c5c2ee",
        "num_processed": 0
      },
      {
        "num_success": 0,
        "description": "Publishing Errata",
        "step_type": "errata",
        "items_total": 0,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "8e46b5e2-89f5-4ef5-80bd-0d2aab9dd2a0",
        "num_processed": 0
      },
      {
        "num_success": 0,
        "description": "Publishing Comps file",
        "step_type": "comps",
        "items_total": 0,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "050aba89-abec-4949-b3cf-28409d9519e0",
        "num_processed": 0
      },
      {
        "num_success": 0,
        "description": "Publishing Metadata.",
        "step_type": "metadata",
        "items_total": 0,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "70efd383-905d-4fe2-8c9b-4e18311e76d5",
        "num_processed": 0
      },
      {
        "num_success": 1,
        "description": "Closing repo metadata",
        "step_type": "close_repo_metadata",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "e3ae5910-8f8d-4e53-abd6-007a9495e0b4",
        "num_processed": 1
      },
      {
        "num_success": 0,
        "description": "Generating sqlite files",
        "step_type": "generate sqlite",
        "items_total": 1,
        "state": "SKIPPED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "ae023865-a176-4434-b8ab-77a080306602",
        "num_processed": 0
      },
      {
        "num_success": 0,
        "description": "Generating HTML files",
        "step_type": "repoview",
        "items_total": 1,
        "state": "SKIPPED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "4d7ca329-7b33-478e-a0a5-777771d8c7c6",
        "num_processed": 0
      },
      {
        "num_success": 1,
        "description": "Publishing files to web",
        "step_type": "publish_directory",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "0989644f-85dc-43ff-9e0f-10c814a8d5e8",
        "num_processed": 1
      },
      {
        "num_success": 1,
        "description": "Writing Listings File",
        "step_type": "initialize_repo_metadata",
        "items_total": 1,
        "state": "FINISHED",
        "error_details": [

        ],
        "details": "",
        "num_failures": 0,
        "step_id": "04b588ee-11fe-4b09-8a42-2ea465247c0b",
        "num_processed": 1
      }
    ]
  },
  "error": null,
  "_id": {
    "$oid": "58dd7580e6919db96421ea12"
  },
  "id": "58dd7580e6919db96421ea12"
}
```
