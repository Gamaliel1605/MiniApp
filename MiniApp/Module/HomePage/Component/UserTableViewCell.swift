//
//  UserTableViewCell.swift
//  MiniApp
//
//  Created by Carlos on 21/02/24.
//

import UIKit
import AlamofireImage

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setupView(urlImage: String, name: String, email: String) {
        if let urlPath = URL(string: urlImage) {
            DispatchQueue.main.async {
                self.userImage.af.setImage(withURL: urlPath)
            }
        }
        userName.text = name
        userEmail.text = email
    }
    
}
