//
//  ContentView.swift
//  TıklamaOyunu
//
//  Created by kerem on 24.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var score = 0
        // Oyun süresi
        @State var timeRemaining = 10
        
        // Tıklandığında çalışacak fonksiyon
        func buttonTapped() {
            score += 1
        }
        
        // Zamanlayıcı için sayac fonksiyonu
        func countDown() {
            timeRemaining -= 1
            
            // Süre bittiğinde oyunu bitir
            if timeRemaining == 0 {
                gameOver()
            }
        }
        
        // Oyun bittiğinde çalışacak fonksiyon
        func gameOver() {
            // Uyarı göster
            let alert = UIAlertController(title: "Oyun Bitti", message: "Puanınız: \(score)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tekrar Oyna", style: .default, handler: { action in
                // Yeni oyun başlat
                self.newGame()
            }))
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
        }
        
        // Yeni oyun başlatmak için fonksiyon
        func newGame() {
            score = 0
            timeRemaining = 10
        }
        
    
    var body: some View {
        VStack(spacing: 20) //VStack deki tüm elemanların sağ sol yukarı aşşağı kısımlara 20 piksellik boşluk bıraktırır bu kod
        {
                   // Oyun puanı
                   Text("Puan: \(score)")
                       .font(.largeTitle)
                   // Oyun süresi
                   Text("Kalan Süre: \(timeRemaining)")
                       .font(.title)
                   
                   // Tıklama butonu
                   Button(action: buttonTapped) {
                       Text("Tıkla!")
                           .font(.title)
                           .foregroundColor(.white)
                           .padding()
                           .background(Color.blue)
                           .cornerRadius(10)
                   }
                   
               }
        
        //on appear = göründüğünde demek yani .onAppear(){} in küme parantezi içine yazılanlar ekran göründüğünde olacak olanlardır.
        //burda repeats true olduğu için sonsuza kadar ekran her gözükdüğünde countDown() fonksiyonu çağırılır sonra biter sonra gine çağırılır.
               .onAppear() {
                   // Zamanlayıcıyı başlat
                   Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                       countDown()
                   }
               }
           }
       }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
