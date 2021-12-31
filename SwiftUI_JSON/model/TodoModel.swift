//
// Created by Desire L on 2022/01/01.
//

import Foundation


struct TodoModel: Codable, Identifiable {
    var userId: Int?
    var id: Int?
    var title: String?
    var completed: Bool?

}
