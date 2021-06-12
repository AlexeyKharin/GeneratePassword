

import UIKit
struct  ImageContent {
    let image: UIImage
    let likes: String
    let views: String
    let discreption: String
    let title: String
}
struct PostContent {
    let imageContent: [ImageContent]
    let profileImage: UIImage?
    let profileName: String?
}

struct Strotage {
    static let collection: [PostContent] = [PostContent(imageContent: [ImageContent(image: #imageLiteral(resourceName: "vedmak"), likes: "Likes: 240", views: "Views: 312", discreption: "Новые кадры со съёмок второго сезона Ведьмак", title: "vedmak.official"), ImageContent(image: #imageLiteral(resourceName: "netology"), likes: "Likes: 766", views: "Views: 893", discreption: "От 'Hello, World' до первого сложного iOS-приложения — всего один курс. Если чувствуете в себе силу для покорения топов AppStore — пора начинать действовать!Профессия «iOS-разработчик» — тот самый путь, по которому стоит пройти до самого конца. Вы научитесь создавать приложения на языке Swift с нуля: от начинки до интерфейса. Чтобы закрепить знания на практике, каждый студент подготовит дипломную работу — Instagram-like приложение с возможностью публиковать фотографии, использовать фильтры, ставить лайки и подписываться на других пользователей", title: "Нетология. Меряем через образование."), ImageContent(image: #imageLiteral(resourceName: "habib"), likes: "Likes: 12000", views: "Views: 5000000", discreption: "Один гулял по улице, один сидел в кафе ))) ☕️ - Как вы думаете, насколько масштабны будут последствия от этой суеты? Здоровья нам всем 🤲", title: "khabib_nurmagomedov"), ImageContent(image: #imageLiteral(resourceName: "ronaldo"), likes: "Likes: 134055", views: "Views: 1500000", discreption: "Всегда оставайтесь оптимистами. Надо быть профессионалом и работать так, как вы можете. Тяжелый труд является ключом к успеху", title: "Криштиану Роналду")], profileImage: #imageLiteral(resourceName: "Lion"), profileName: "Hipster cat")]
}

