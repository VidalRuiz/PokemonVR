import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set dynamic background color (Light & Dark Mode)
        view.backgroundColor = UIColor(named: "LaunchBackground")

        // Pokémon Logo
        let logoImageView = UIImageView(image: UIImage(named: "Pokemon"))
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.contentMode = .scaleAspectFit
        view.addSubview(logoImageView)

        // Center the logo
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 100)
        ])

        // Animate logo fade-in effect
        logoImageView.alpha = 0
        UIView.animate(withDuration: 1.2) {
            logoImageView.alpha = 1
        }

        // Delay for 1.5 seconds and transition to Main Screen
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.transitionToMainScreen()
        }
    }

    /// Transitions from Splash to Main Screen with a smooth animation
    private func transitionToMainScreen() {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else { return }
        
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        
        UIView.transition(with: window,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: {
                              window.rootViewController = mainVC
                          })
    }
}
