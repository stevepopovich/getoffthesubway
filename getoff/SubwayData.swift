// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let subwayData = try? newJSONDecoder().decode(SubwayData.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.subwayDataTask(with: url) { subwayData, response, error in
//     if let subwayData = subwayData {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - SubwayData
struct SubwayData: Codable {
    let meta: Meta
    let data: [[Datum]]
}

enum Datum: Codable {
    case integer(Int)
    case string(String)
    case null

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if container.decodeNil() {
            self = .null
            return
        }
        throw DecodingError.typeMismatch(Datum.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Datum"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        case .null:
            try container.encodeNil()
        }
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.metaTask(with: url) { meta, response, error in
//     if let meta = meta {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Meta
struct Meta: Codable {
    let view: MetaViewData
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.viewTask(with: url) { view, response, error in
//     if let view = view {
//       ...
//     }
//   }
//   task.resume()

// MARK: - View
struct MetaViewData: Codable {
    let id, name: String
    let averageRating, createdAt: Int
    let displayType: String
    let downloadCount: Int
    let hideFromCatalog, hideFromDataJSON: Bool
    let indexUpdatedAt: Int
    let newBackend: Bool
    let numberOfComments, oid: Int
    let provenance: String
    let publicationAppendEnabled: Bool
    let publicationDate, publicationGroup: Int
    let publicationStage: String
    let rowsUpdatedAt: Int
    let rowsUpdatedBy: String
    let tableID, totalTimesRated, viewCount, viewLastModified: Int
    let viewType: String
    let approvals: [Approval]
    let childViews: [String]
    let columns: [Column]
    let displayFormat: DisplayFormat
    let grants: [Grant]
    let metadata: Metadata
    let owner: Owner
    let query: Query
    let rights: [String]
    let tableAuthor: Owner
    let flags: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, averageRating, createdAt, displayType, downloadCount, hideFromCatalog
        case hideFromDataJSON = "hideFromDataJson"
        case indexUpdatedAt, newBackend, numberOfComments, oid, provenance, publicationAppendEnabled, publicationDate, publicationGroup, publicationStage, rowsUpdatedAt, rowsUpdatedBy
        case tableID = "tableId"
        case totalTimesRated, viewCount, viewLastModified, viewType, approvals, childViews, columns, displayFormat, grants, metadata, owner, query, rights, tableAuthor, flags
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.approvalTask(with: url) { approval, response, error in
//     if let approval = approval {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Approval
struct Approval: Codable {
    let reviewableUid: String
    let reviewedAt: Int
    let reviewedAutomatically: Bool
    let state: String
    let submissionID: Int
    let submissionObject, submissionOutcome: String
    let submittedAt, workflowID: Int
    let submissionDetails: SubmissionDetails
    let submissionOutcomeApplication: SubmissionOutcomeApplication
    let submitter: Submitter

    enum CodingKeys: String, CodingKey {
        case reviewableUid, reviewedAt, reviewedAutomatically, state
        case submissionID = "submissionId"
        case submissionObject, submissionOutcome, submittedAt
        case workflowID = "workflowId"
        case submissionDetails, submissionOutcomeApplication, submitter
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.submissionDetailsTask(with: url) { submissionDetails, response, error in
//     if let submissionDetails = submissionDetails {
//       ...
//     }
//   }
//   task.resume()

// MARK: - SubmissionDetails
struct SubmissionDetails: Codable {
    let permissionType: String
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.submissionOutcomeApplicationTask(with: url) { submissionOutcomeApplication, response, error in
//     if let submissionOutcomeApplication = submissionOutcomeApplication {
//       ...
//     }
//   }
//   task.resume()

// MARK: - SubmissionOutcomeApplication
struct SubmissionOutcomeApplication: Codable {
    let failureCount: Int
    let status: String
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.submitterTask(with: url) { submitter, response, error in
//     if let submitter = submitter {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Submitter
struct Submitter: Codable {
    let id, displayName: String
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.columnTask(with: url) { column, response, error in
//     if let column = column {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Column
struct Column: Codable {
    let id: Int
    let name, dataTypeName, fieldName: String
    let position: Int
    let renderTypeName: String
    let format: Query
    let flags: [String]?
    let tableColumnID: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, dataTypeName, fieldName, position, renderTypeName, format, flags
        case tableColumnID = "tableColumnId"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.queryTask(with: url) { query, response, error in
//     if let query = query {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Query
struct Query: Codable {
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.displayFormatTask(with: url) { displayFormat, response, error in
//     if let displayFormat = displayFormat {
//       ...
//     }
//   }
//   task.resume()

// MARK: - DisplayFormat
struct DisplayFormat: Codable {
    let distinctLegend: Bool
    let bkgdLayers: [BkgdLayer]
    let exclusiveLayers: Bool
    let viewDefinitions: [ViewDefinition]
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.bkgdLayerTask(with: url) { bkgdLayer, response, error in
//     if let bkgdLayer = bkgdLayer {
//       ...
//     }
//   }
//   task.resume()

// MARK: - BkgdLayer
struct BkgdLayer: Codable {
    let layerKey, alias: String
    let opacity: Int
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.viewDefinitionTask(with: url) { viewDefinition, response, error in
//     if let viewDefinition = viewDefinition {
//       ...
//     }
//   }
//   task.resume()

// MARK: - ViewDefinition
struct ViewDefinition: Codable {
    let uid: String
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.grantTask(with: url) { grant, response, error in
//     if let grant = grant {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Grant
struct Grant: Codable {
    let inherited: Bool
    let type: String
    let flags: [String]
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.metadataTask(with: url) { metadata, response, error in
//     if let metadata = metadata {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Metadata
struct Metadata: Codable {
    let geo: Geo
    let customFields: CustomFields
    let availableDisplayTypes: [String]
    let renderTypeConfig: RenderTypeConfig

    enum CodingKeys: String, CodingKey {
        case geo
        case customFields = "custom_fields"
        case availableDisplayTypes, renderTypeConfig
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.customFieldsTask(with: url) { customFields, response, error in
//     if let customFields = customFields {
//       ...
//     }
//   }
//   task.resume()

// MARK: - CustomFields
struct CustomFields: Codable {
    let update: Update

    enum CodingKeys: String, CodingKey {
        case update = "Update"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.updateTask(with: url) { update, response, error in
//     if let update = update {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Update
struct Update: Codable {
    let dateMadePublic: String

    enum CodingKeys: String, CodingKey {
        case dateMadePublic = "Date Made Public"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.geoTask(with: url) { geo, response, error in
//     if let geo = geo {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Geo
struct Geo: Codable {
    let parentUid: String
    let isNbe: Bool
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.renderTypeConfigTask(with: url) { renderTypeConfig, response, error in
//     if let renderTypeConfig = renderTypeConfig {
//       ...
//     }
//   }
//   task.resume()

// MARK: - RenderTypeConfig
struct RenderTypeConfig: Codable {
    let visible: Visible
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.visibleTask(with: url) { visible, response, error in
//     if let visible = visible {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Visible
struct Visible: Codable {
    let geoRows: Bool
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.ownerTask(with: url) { owner, response, error in
//     if let owner = owner {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Owner
struct Owner: Codable {
    let id, displayName, profileImageURLLarge, profileImageURLMedium: String
    let profileImageURLSmall, screenName, type, userSegment: String
    let flags: [String]

    enum CodingKeys: String, CodingKey {
        case id, displayName
        case profileImageURLLarge = "profileImageUrlLarge"
        case profileImageURLMedium = "profileImageUrlMedium"
        case profileImageURLSmall = "profileImageUrlSmall"
        case screenName, type, userSegment, flags
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func subwayDataTask(with url: URL, completionHandler: @escaping (SubwayData?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
