//
//  OnboardingCollectionViewCell.swift
//  Yummie
//
//  Created by STARK on 21.05.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.description
    }
}

//İlk olarak, UIKit framework'ünü projenize dahil etmek için import UIKit satırını ekleyin. Bu, UICollectionViewCell, UIImageView, UILabel gibi UIKit sınıflarını kullanabileceğimizi belirtir.
//
//OnboardingCollectionViewCell adında bir sınıf tanımlıyoruz. Bu sınıf, UICollectionViewCell sınıfından türetilmiştir, yani bir koleksiyon hücresi olarak kullanılacak.
//
//static let identifier değişkeni, hücrenin tanımlayıcı değerini temsil eder. Bu değer, hücreyi yeniden kullanmak veya belirli bir hücreyi tanımak için kullanılır.
//
//@IBOutlet ifadesi, hücredeki UI öğelerine referans sağlar. slideImageView, slideTitleLbl ve slideDescriptionLbl adında üç adet UIImageView ve UILabel öğesini tanımlıyoruz. Bu öğeler, hücre içindeki görsel ve metin içeriğini temsil eder.
//
//setup(_ slide: OnboardingSlide) fonksiyonu, hücrenin içeriğini ayarlamak için kullanılır. Bu fonksiyon, OnboardingSlide tipinde bir parametre alır. Bu parametre, hücrenin içeriğini temsil eden bir veri modelini temsil eder.
//
//setup(_ slide: OnboardingSlide) fonksiyonunda, slide parametresi kullanılarak hücrenin içeriği ayarlanır. slideImageView.image özelliği, geçilen slide nesnesindeki resmi ayarlar. slideTitleLbl.text ve slideDescriptionLbl.text özellikleri ise geçilen slide nesnesindeki başlık ve açıklama metinlerini ayarlar.
//
//Yukarıdaki kod, bir OnboardingCollectionViewCell sınıfını tanımlar. Bu sınıf, bir koleksiyon görünümünde kullanılmak üzere tasarlanmış bir hücredir. Hücre, görsel ve metin içeriğini temsil eden UI öğelerini içerir. setup fonksiyonu, hücrenin içeriğini belirli bir veri modeline dayanarak ayarlamak için kullanılır.
