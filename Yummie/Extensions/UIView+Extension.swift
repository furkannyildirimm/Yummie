//
//  UIView+Extension.swift
//  Yummie
//
//  Created by STARK on 21.05.2023.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get{ return self.cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}

//İlk olarak, UIKit framework'ünü projenize dahil etmek için import UIKit satırını ekleyin. Bu, UIView ve CGFloat gibi UIKit sınıflarını ve veri tiplerini kullanabileceğimizi belirtir.
//
//UIView sınıfına ait bir genişletme (extension) tanımlamak için extension UIView ifadesini kullanıyoruz. Bu, UIView sınıfının özelliklerini genişletebileceğimizi belirtir.
//
//@IBInspectable ifadesi, cornerRadius özelliğinin Interface Builder'da görünür olmasını sağlar. Bu özellik sayesinde, cornerRadius değerini doğrudan Xcode'un Interface Builder üzerinden ayarlayabilirsiniz.
//
//cornerRadius adında bir hesaplanmış özellik tanımlıyoruz. Bu özellik, UIView'un köşelerinin yuvarlatma yarıçapını temsil eder ve CGFloat veri tipinde değer alır.
//
//get bloğu, cornerRadius değerini döndürür. Bu durumda, return cornerRadius ifadesiyle cornerRadius değerini doğrudan döndürüyoruz.
//
//set bloğu, cornerRadius değerini ayarlar. Bu durumda, self.layer.cornerRadius = newValue ifadesiyle view'un layer özelliğine ait cornerRadius değerini ayarlıyoruz. newValue ifadesi, set bloğuna gelen yeni değeri temsil eder.
//
//Yukarıdaki kod, bir UIView nesnesine cornerRadius özelliğini ekleyen bir genişletme tanımlar. Bu sayede, bir UIView nesnesini Interface Builder'da seçtiğinizde, Utilities panelinde "Attributes Inspector" bölümünde cornerRadius özelliğini görebilir ve istediğiniz köşe yuvarlama değerini ayarlayabilirsiniz.
//
//Örneğin, bir UIView nesnesi oluşturduktan sonra view.cornerRadius = 10 şeklinde bir kod yazarsanız, bu UIView'un köşeleri 10 birim yarıçapında yuvarlanacaktır.
