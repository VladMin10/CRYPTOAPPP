//
//  CoursesDataService.swift
//  CRYPTOAPPP
//
//  Created by Vladyslav Mi on 01.03.2024.
//

import Foundation
import MapKit

class CoursesDataService {
    
    static let courses: [Course] = [
        Course(
                title: "Block №1",
                noOfBreakPoints: 5,
                description: " 1.1 Вступ. Словник. Базові поняття \n 1.2 Види аналізу. Таймфрейми. Стилі торгівлі \n 1.3 Блокчейн. Монети. Токени. Смарт-контракт \n 1.4 Японські свічки \n 1.5 Робота з біржею та гаманцями" ,
                imageNames: [
                    "logo-block1",
                ],
                supportLink: "[1](https://en.wikipedia.org/wiki/Colosseum)",
                coordinates: CLLocationCoordinate2D(latitude: 50.4501, longitude: 30.5234) // Corrected indentation
    ),
        
        Course(
                title: "Block №2",
                noOfBreakPoints: 3,
                description: " 2.1 Структура ціни. Зміна ринкової структури \n 2.2 Ліквідність \n 2.3 Зони інтересу",
                imageNames: [
                    "logo-block2",
                ],
                supportLink: "[1](https://en.wikipedia.org/wiki/Colosseum)",
                coordinates: CLLocationCoordinate2D(latitude: 52.2297, longitude: 21.0122)  // Corrected indentation
    ),
        
        Course(
                title: "Block №3",
                noOfBreakPoints: 3,
                description: " 3.1 Рендж \n 3.2 Wyckoff, AMD \n 3.3 Фібоначчі",
                imageNames: [
                    "logo-block3",
                ],
                supportLink: "[1](https://en.wikipedia.org/wiki/Colosseum)",
                coordinates: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)  // Corrected indentation
    ),
        
        Course(
                title: "Block №4",
                noOfBreakPoints: 4,
                description: "4.1 Ризик менеджмент. Стратегія. Статистика. Розрахунок обʼєму позиції \n 4.2 Менеджмент позиції. Як входити на LTF. Приклади ТВХ \n 4.3 Entry models \n 4.4 Психологія в трейдингу",
                imageNames: [
                    "logo-block-4",
                ],
                supportLink: "[1](https://en.wikipedia.org/wiki/Colosseum)",
                coordinates: CLLocationCoordinate2D(latitude: 41.9028, longitude: 12.4964)  // Corrected indentation
    ),
        
        Course(
                title: "Block №5",
                noOfBreakPoints: 9,
                description: "5.1 NFT \n 5.2 ICO / IDO \n 5.3 Тестнети \n 5.4 Дропи \n 5.5 Фармінг",
                imageNames: [
                    "logo-block5",
                ],
                supportLink: "[1](https://en.wikipedia.org/wiki/Colosseum)",
                coordinates: CLLocationCoordinate2D(latitude: 51.5074, longitude: -0.1278)  // Corrected indentation
    ),
        
    ]
    
}
