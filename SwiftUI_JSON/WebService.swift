//
// Created by Desire L on 2022/01/01.
//

import Foundation

class WebService {
    private var defaultAPIURL = "https://jsonplaceholder.typicode.com/todos"


    private func getRequest() -> URLRequest? {
        guard let url: URL = URL(string: defaultAPIURL) else {
            return nil
        }
        return URLRequest(url: url)
    }


    private func fetchDataFromRequest(_ request: URLRequest,
                                      _ completion: @escaping ([TodoModel]) -> Void) -> URLSessionDataTask {
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response: HTTPURLResponse = response as? HTTPURLResponse else {
                return
            }
            print("###HTTP STATUS CODE = \(response.statusCode)")
            guard let data: Data = data else {
                return
            }
            do {
                let todoModels: [TodoModel] = try JSONDecoder().decode([TodoModel].self, from: data)
                completion(todoModels)
            } catch {
                print(error)
            }
        }
    }


    func getTodos(completion: @escaping ([TodoModel]) -> Void) {
        let request = getRequest()
        guard let request = request else {
            return
        }
        fetchDataFromRequest(request, completion)
            .resume()
    }
}
