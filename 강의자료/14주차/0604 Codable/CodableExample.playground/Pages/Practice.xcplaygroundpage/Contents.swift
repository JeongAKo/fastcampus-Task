//: [Previous](@previous)
import Foundation

let decoder = JSONDecoder()

/***************************************************
 1번 문제
 - 다음 JSON 내용을 Fruit 타입으로 변환
 ***************************************************/
print("\n---------- [ 1번 문제 (Fruits) ] ----------\n")
let jsonFruits = """
[
  {
    "name": "Orange",
    "cost": 100,
    "description": "A juicy orange"
  },
  {
    "name": "Apple",
    "cost": 200,
  },
  {
    "name": "Watermelon",
    "cost": 300,
  }
]
""".data(using: .utf8)!


struct Fruit: Decodable {
    let name: String
    let cost: Int
    let description: String?
}

let jsonDecoder = JSONDecoder()
let fruit = try decoder.decode([Fruit].self, from: jsonFruits)
fruit.forEach{print($0)}




/***************************************************
 2번 문제
 - 다음 JSON 내용을 Report 타입으로 변환
 ***************************************************/
print("\n---------- [ 2번 문제 (Report) ] ----------\n")
let jsonReport = """
{
  "name": "Final Results for iOS",
  "report_id": "905",
  "read_count": "10",
  "report_date": "2019-02-14",
}
""".data(using: .utf8)!

struct Report: Codable {
    let name: String
    let reportID: String
    let readCount: String
    let reportDate: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case reportID = "report_id"
        case readCount = "read_count"
        case reportDate = "report_date"
    }
}

let secondDecoder = JSONDecoder()
let report = try secondDecoder.decode(Report.self, from: jsonReport)

print(report)




/***************************************************
 3번 문제
 - Nested Codable 내용을 참고하여 다음 JSON 내용을 파싱
 ***************************************************/
print("\n---------- [ 3번 문제 (Movie) ] ----------\n")
let jsonMovie = """
[
  {
    "name": "Edward",
    "favorite_movies": [
      {
        "title": "Big Fish",
        "release_year": 2003
      },
      {
        "title": "Gran Torino",
        "release_year": 2008
      },
      {
        "title": "3 Idiots",
        "release_year": 2009
      },
    ]
  }
]
""".data(using: .utf8)!

struct Person {
    let name: String
    let favoriteMovies: [Movie]
    
    struct Movie {
        let title: String
        let releaseYear: Int
        
        private enum CodingKeys: String, CodingKey {
            case title
            case releaseYear = "release_year"
        }
    
  }
    private enum CodingKeys: String, CodingKey {
        case name
        case favoriteMovies = "favorite_movies"
    }
}

extension Person: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        favoriteMovies = try values.decode([Movie].self, forKey: .favoriteMovies)
    }
}

extension Person.Movie: Decodable {
    init(from decoder: Decoder) throws {
        let movie = try decoder.container(keyedBy: CodingKeys.self)
        title = try movie.decode(String.self, forKey: .title)
        releaseYear = try movie.decode(Int.self, forKey: .releaseYear)
    }
}

if let report = try? JSONDecoder().decode([Person].self, from: jsonMovie) {
    print("Name :", report[0].name)
    report[0].favoriteMovies.forEach { print($0) }
}


/***************************************************
 4번 문제
 - 다음 URL의 Repository 정보 중에서 다음 속성만을 골라서 데이터 모델로 만들고 출력
 - https://api.github.com/search/repositories?q=user:giftbott
 - 위 URL의 user 부분을 자신의 아이디로 변경
 - full_name, description, stargazers_count, forks_count, html_url
 ***************************************************/

print("\n---------- [ 4번 문제 (URL 이용) ] ----------\n")

struct Repositories: Decodable {
    let items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    struct Item: Decodable {
        let fullName: String
        let description: String?
        let stargazersCount: Int
        let forksCount: Int
        let htmlURL: String
        
        private enum CodingKeys: String, CodingKey {
            case fullName = "full_name"
            case description
            case stargazersCount = "stargazers_count"
            case forksCount = "forks_count"
            case htmlURL = "html_url"
        }
    }
}

//extension Repositories.Item: Decodable {
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        fullName = try values.decode(String.self, forKey: .fullName)
//        description = try values.decode(String.self, forKey: .description)
//        stargazersCount = try values.decode(Int.self, forKey: .stargazersCount)
//        forksCount = try values.decode(Int.self, forKey: .forksCount)
//        htmlURL = try values.decode(String.self, forKey: .htmlURL)
//
//    }
//}

//extension Repositories.Item: Decodable {
//    init(from decoder: Decoder) throws {
//        let url = try decoder.container(keyedBy: CodingKeys.self)
//        htmlURL = try url.decode(String.self, forKey: .htmlURL)
//    }
//}


func fetchGitHubRepositories() {
  let urlString = "https://api.github.com/search/repositories?q=user:JeongAKo"
  let url = URL(string: urlString)!
    
    
    
    let dataTask = URLSession.shared.dataTask(with: url) { (data, reponse, error) in
        guard error == nil else { return print(error!)}
        guard let reponse = reponse as? HTTPURLResponse,
        200..<400 ~= reponse.statusCode
            else { return print("Status Code od not vaild")}
        guard let data = data,
        let jsonObject = try? JSONDecoder().decode(Repositories.self, from: data)
            else { return print("No data")}
        for repository in jsonObject.items {
            print(repository)
            print("= = = = = = = = = =")
        }
    }
    dataTask.resume()
}


fetchGitHubRepositories()



//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
