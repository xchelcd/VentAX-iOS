//
//  Util.swift
//  VentAX
//
//  Created by Xchel Alonso Carranza De La O on 10/04/21.
//

import Foundation
import UIKit

class Util{

    public static var myInstance:HomeViewController?
    
    static func getCategory(categoryId id:Int)-> String{
        switch id {
        case 0: return category_.food.rawValue
        case 1: return category_.electronic.rawValue
        case 2: return category_.health.rawValue
        case 3: return category_.style.rawValue
        case 4: return category_.dessert.rawValue
        case 5: return category_.sport.rawValue
        case 6: return category_.fashion.rawValue
        case 7: return category_.handMade.rawValue
        case 8: return category_.gift.rawValue
        case 9: return category_.pets.rawValue
        case 10: return category_.clothes.rawValue
        case 11: return category_.art.rawValue
        case 12: return category_.accesory.rawValue
        default:
            return defaultMesage.sinCoincidencia.rawValue
        }
    }
    
    static func getAccount(accountType id:Int) -> String{
        switch id {
        case 0: return account_.basic.rawValue
        case 1: return account_.premium.rawValue
        case 2: return account_.business.rawValue
            
        default: return defaultMesage.nulo.rawValue
        }
    }
    
    static func getFAQNumber(priority:Int) -> Int{
        switch priority {
        case 0:
            return Constants.FAQ_BASIC
        case 1:
            return Constants.FAQ_PREMIUM
        case 2:
            return Constants.FAQ_BUSINESS
        default:
            return 0
        }
    }
    
    static func getProductNumber(priority:Int) -> Int{
        switch priority {
        case 0:
            return Constants.ITEM_BASIC
        case 1:
            return Constants.ITEM_PREMIUM
        case 2:
            return Constants.ITEM_BUSINESS
        default:
            return 0
        }
    }
    
    static func getSocialMedia(socialMediaId:Int) -> String{
        var socialMedia = ""
        
        switch socialMediaId {
        case 0:
            socialMedia = Constants.SOCIAL_MEDIA_FACEBOOK_IMG
        case 1:
            socialMedia = Constants.SOCIAL_MEDIA_INSTAGRAM_IMG
        case 2:
            socialMedia = Constants.SOCIAL_MEDIA_TWITTER_IMG
        default:
            socialMedia = Constants.SOCIAL_MEDIA_WEB_IMG
        }
        
        return socialMedia
    }
    
    static func goToSocialMedia(socialMediaId: Int, code:String) /*-> [String:String?]*/{
        var nameApp = ""
        var nameWeb = ""
        switch socialMediaId {
        case 0:
            nameApp = "\(Constants.APP_URL_FACEBOOK)"
            nameWeb = "\(Constants.WEB_URL_FACEBOOK)\(code)"
        case 1:
            nameApp = "\(Constants.APP_URL_INSTAGRAM)"
            nameWeb = "\(Constants.WEB_URL_INSTAGRAM)\(code)"
        case 2:
            nameApp = "\(Constants.APP_URL_TWITTER)"
            nameWeb = "\(Constants.WEB_URL_TWITTER)\(code)"
        case 3: nameWeb = code
        default:
            //MARK: - OPEN WHATS
            nameApp = "\(Constants.APP_URL_INSTAGRAM)"
        }
        
        let app = "\(nameApp)\(Constants.APP_URL)\(code)"
        let web = "\(nameWeb)"
        
        print(app)
        print(web)
        
        let appURL = NSURL(string: app)
        let webURL = NSURL(string: web)
        
        if UIApplication.shared.canOpenURL(appURL! as URL){
            if #available(iOS 10.0, *){
                UIApplication.shared.open(appURL! as URL, options: [:], completionHandler: nil)
            }else{
                UIApplication.shared.canOpenURL(appURL! as URL)
            }
        }else{
            if #available(iOS 10.0, *){
                UIApplication.shared.open(webURL! as URL, options: [:], completionHandler: nil)
            }else{
                UIApplication.shared.canOpenURL(webURL! as URL)
            }
        }
        
        /*return [
            "app":appURL?.absoluteString,
            "web:":webURL?.absoluteString
        ]*/
    }
}

enum category_: String{
    case food = "Comida"
    case electronic = "Electrónica"
    case health = "Salud"
    case style = "Estilo"
    case dessert = "Postres"
    case sport = "Deportes"
    case fashion = "Moda"
    case handMade = "Manulidades"
    case gift = "Regalos"
    case pets = "Mascotas"
    case clothes = "Ropa"
    case art = "Arte"
    case accesory = "Accesorios"
}

enum account_: String{
    case basic = "Basica"
    case premium = "Premium"
    case business = "Business"
}

enum defaultMesage: String{
    case noEspecificado = "No espcificado"
    case sinCoincidencia = "Sin coincidencias"
    case affiliate = "Afiliado"
    case noAffiliate = "No afiliado"
    case nulo = "Nulo"
    case empty = "-"
    case active = "Activo"
    case desactive = "Desactivado"
    case suspendCompany = "SUSPENDER MI EMPRESA"
    case activeCompany = "ACTIVAR MI EMPRESA"
}

enum days:String{
    case monday = "Lunes"
    case tuesday = "Martes"
    case wednesday = "Miércoles"
    case thursday = "Jueves"
    case friday = "Viernes"
    case saturdat = "Sábado"
    case sundat = "Domingo"
}

enum navItems:String{
    case menu = "Menu"
    case profile = "Mi perfil"
    case shoppingCart = "Carrito"
    case company = "Mi empresa"
    case orderCompany = "Pedidos"
    case product = "Productos"
    case settings = "Configuracioes"
    case faq = "FAQ"
    case logout = "Cerrar sesión"
}

enum stateOrder:String{
    case pending = "Pendiente"
    case acepted = "Aceptado"
    case process = "En proceso"
    case finished = "Terminado"
    case canceled = "Cacelado"
    case pending_ = "Esperando confirmación"
    case acepted_ = "Pedido aceptado"
    case process_ = "Estamos trabajando en ello"
    case finished_ = "Listo para definir entrega"
}
