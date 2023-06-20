//
//  OnboardingViewController.swift
//  Yummie
//
//  Created by STARK on 21.05.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            } else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
//    Yukarıdaki kod bloğu, currentPage değişkeninin değeri her değiştiğinde otomatik olarak çalışacak bir didSet bloğunu tanımlar.
//
//    didSet bloğu içindeki kodlar, currentPage değeri değiştiğinde yapılacak işlemleri belirler. İşte bu bloğun yaptığı işlemler:
//
//    pageControl.currentPage değeri, currentPage değeri ile eşitlenir. Bu sayede sayfa kontrolünün mevcut sayfayı göstermesi sağlanır. pageControl, kullanıcıya hangi slaytın görüntülendiğini gösteren noktaları içeren bir UI öğesidir.
//
//    currentPage değeri, slides dizisinin eleman sayısının bir eksiği (son indeks) ile karşılaştırılır. Eğer currentPage, son slayta (son indekse) eşitse, bu demektir ki kullanıcı son slayttadır. Bu durumda nextBtn adlı düğmenin metni "Get Started" olarak ayarlanır.
//
//    Eğer currentPage, son slayta eşit değilse, yani kullanıcı henüz son slayta ulaşmamışsa, nextBtn düğmesinin metni "Next" olarak ayarlanır.
//
//    Bu kod bloğu, currentPage değeri değiştiğinde sayfa kontrolünün ve ileri butonunun durumunu güncellemek için kullanılır. Kullanıcının mevcut slayttan diğer slaytlara geçtiğinde veya son slayta ulaştığında görsel geri bildirim sağlamak için kullanılır.
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let service = NetworkService()
//        let request = service.createRequest(route: .temp, method: .get, parameters: ["firstName":"Emmanuel", "lastName": "Okwara"])
//        print("\(request?.url)")
        
        slides = [
            OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
            OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
            OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
        ]
        pageControl.numberOfPages = slides.count
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x/width)
        
    }
}

//İlk olarak, UIKit framework'ünü projenize dahil etmek için import UIKit satırını ekleyin. Bu, UIViewController, UIPageControl, UIButton, UICollectionView gibi UIKit sınıflarını kullanabileceğimizi belirtir.
//
//OnboardingViewController adında bir sınıf tanımlıyoruz. Bu sınıf, UIViewController sınıfından türetilmiştir, yani bir görünüm denetleyicisidir.
//
//@IBOutlet ifadesi, görünüm dosyasında oluşturulan UI öğelerine referans sağlar. pageControl, nextBtn ve collectionView adında üç adet UIPageControl, UIButton ve UICollectionView öğesini tanımlıyoruz. Bu öğeler, onboarding ekranındaki sayfa kontrolü, ileri butonu ve koleksiyon görünümünü temsil eder.
//
//slides adında bir dizi tanımlanır. Bu dizi, OnboardingSlide türünden nesneleri içerir. OnboardingSlide, onboarding slaytlarının başlık, açıklama ve görsel içeriğini temsil eden bir veri modelidir.
//
//currentPage adında bir değişken tanımlanır. Bu değişken, mevcut sayfanın indeksini temsil eder. didSet bloğu, currentPage değeri değiştiğinde otomatik olarak çağrılır. Bu blok, sayfa kontrolünün mevcut sayfayı güncellemesini sağlar ve ileri butonunun metnini uygun şekilde ayarlar.
//
//viewDidLoad fonksiyonu, görünüm yüklendiğinde çağrılır. Bu fonksiyonda, slides dizisine onboarding slaytlarını ekleriz. Her slayt için başlık, açıklama ve görsel içeriği belirleriz.
//
//nextBtnClicked fonksiyonu, ileri butonuna tıklandığında çağrılır. İlk kontrol, mevcut sayfanın son sayfa olup olmadığını kontrol eder. Eğer son sayfadaysa, ana ekranı temsil eden bir görünüm denetleyicisi oluşturur ve kullanıcıya sunar. Son sayfa değilse, currentPage değerini bir artırır ve koleksiyon görünümünü ilgili sayfaya kaydırır.
//
//OnboardingViewController sınıfına UICollectionViewDelegate, UICollectionViewDataSource ve UICollectionViewDelegateFlowLayout protokollerini uygularız. Bu protokoller, koleksiyon görünümünün veri kaynağı ve düzenlemesiyle ilgili gereken işlevleri sağlar.
//
//collectionView(_:numberOfItemsInSection:) fonksiyonu, koleksiyon görünümündeki hücre sayısını belirler. Burada, slides dizisinin eleman sayısını döndürür.
//
//collectionView(_:cellForItemAt:) fonksiyonu, koleksiyon hücrelerini döndürmek için kullanılır. Bu fonksiyonda, OnboardingCollectionViewCell hücrelerini tanımlar ve slides dizisindeki ilgili slaytı kullanarak hücreyi ayarlar.
//
//collectionView(_:layout:sizeForItemAt:) fonksiyonu, koleksiyon hücrelerinin boyutunu belirler. Bu fonksiyonda, koleksiyon görünümünün genişliği ve yüksekliği kadar bir boyut döndürülür.
//
//scrollViewDidEndDecelerating(_:) fonksiyonu, koleksiyon görünümünün kaydırması tamamlandığında çağrılır. Bu fonksiyonda, mevcut sayfanın indeksini hesaplayarak currentPage değerini günceller.
//
//Yukarıdaki kod, bir OnboardingViewController sınıfını tanımlar. Bu sınıf, onboarding ekranını temsil eder ve onboarding slaytlarını koleksiyon görünümünde gösterir. Kullanıcı ileri butonuna tıkladığında sayfalar arasında geçiş yapar ve son sayfaya geldiğinde ana ekrana yönlendirilir.
//
//Umarım bu adımlar size yardımcı olur. Eğer hala herhangi bir sorunuz varsa, sormaktan çekinmeyin.
