//
//  HeroViewController.swift
//  TechZadacha
//
//  Created by Tilek on 24/1/22.
//

import UIKit



extension UIImageView {
    func downloadedFrom(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloadedFrom(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(from: url, contentMode: mode)
    }

}


class HeroViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attributeLbl: UILabel!
    @IBOutlet weak var attacLbl: UILabel!
    @IBOutlet weak var legsLbl: UILabel!
    
    
    
    var hero: HeroStats?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = hero?.localized_name
        attributeLbl.text = hero?.primary_attr
        attacLbl.text = hero?.attack_type
        legsLbl.text = "\((hero?.legs)!)"
        
        let urlString = "https://api.opendota.com"+(hero?.img)!
        let url = URL(string: urlString)
    
        imageView.downloadedFrom(from: url!)
       
    }



}


