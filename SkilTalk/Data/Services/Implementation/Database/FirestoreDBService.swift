import Foundation
import FirebaseFirestore

class FirestoreDBService: DatabaseServiceProtocol {
    private let db = Firestore.firestore()

    func create<T: Encodable>(collection: String, documentId: String?, data: T) async throws {
        let encodedData = try Firestore.Encoder().encode(data)
        if let docId = documentId {
            try await db.collection(collection).document(docId).setData(encodedData)
        } else {
            try await db.collection(collection).addDocument(data: encodedData)
        }
    }

    func read<T: Decodable>(collection: String, documentId: String) async throws -> T? {
        let document = try await db.collection(collection).document(documentId).getDocument()
        guard document.exists else { return nil }
        return try Firestore.Decoder().decode(T.self, from: document.data()!)
    }

    func update<T: Encodable>(collection: String, documentId: String, data: T) async throws {
        let encodedData = try Firestore.Encoder().encode(data)
        try await db.collection(collection).document(documentId).updateData(encodedData)
    }

    func delete(collection: String, documentId: String) async throws {
        try await db.collection(collection).document(documentId).delete()
    }
}
