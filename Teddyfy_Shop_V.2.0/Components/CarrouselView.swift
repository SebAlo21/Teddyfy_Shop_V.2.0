import SwiftUI

// Componente que representa el carrusel de imágenes
struct CarrouselView: View {
    // Lista de URLs de las imágenes
    let imageURLs: [String] = [
        "https://res.cloudinary.com/sasadev/image/upload/fl_preserve_transparency/v1749446586/nuevo_EPink_lq9kie.jpg?_s=public-apps",
        "https://res.cloudinary.com/sasadev/image/upload/fl_preserve_transparency/v1749446586/nuevo_Freddy_dchovi.jpg?_s=public-apps",
        "https://res.cloudinary.com/sasadev/image/upload/fl_preserve_transparency/v1749446587/nuevo_Snoopy_trn0mv.jpg?_s=public-apps",
        "https://res.cloudinary.com/sasadev/image/upload/fl_preserve_transparency/v1749446588/nuevo_TBrow_zpfcsq.jpg?_s=public-apps",
        "https://res.cloudinary.com/sasadev/image/upload/fl_preserve_transparency/v1749446589/nuevo_TPardo_durbx1.jpg?_s=public-apps",
    ]
    
    @State private var currentIndex: Int = 0 // Controla el índice de la imagen actual
    
    var body: some View {
        
        ZStack {
            VStack {
                
                // Vista de carrusel
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(Color("user_C_Pink"))
                    .frame(width: 300, height: 300) // Ajusta el tamaño
                    .overlay {
                        AsyncImage(url: URL(string: imageURLs[currentIndex])) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 250)
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 250, height: 250)
                        .padding()
                    }
                    .padding(5) // Padding exterior opcional
                
            }
            
            HStack {
                // Botón de izquierda
                Button(action: {
                    // Mover al índice anterior
                    if currentIndex > 0 {
                        currentIndex -= 1
                    } else {
                        currentIndex = imageURLs.count - 1
                    }
                }) {
                    Image(systemName: "arrow.left.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color("user_C_Orange2"))
                }
                
                .padding(.trailing, 260) 
                
                // Botón de derecha
                Button(action: {
                    // Mover al índice siguiente
                    if currentIndex < imageURLs.count - 1 {
                        currentIndex += 1
                    } else {
                        currentIndex = 0
                    }
                }) {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color("user_C_Orange2"))
                }
            }
            .padding()
            .frame(width: 300, height: 300) // Asegura que los botones estén encima del recuadro
        }
    }
}

#Preview {
    CarrouselView()
}
