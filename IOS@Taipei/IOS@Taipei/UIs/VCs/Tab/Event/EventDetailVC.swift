//
//  EventVC.swift
//  IOS@Taipei
//
//  Created by Aaron_Ni on 2019/10/20.
//  Copyright © 2019 iOS@Taipei. All rights reserved.
//

import UIKit

class EventDetailVC: UIViewController {
    
    @IBOutlet private weak var titleImageView: UIImageView!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var topicLabel: UILabel!
    
    @IBOutlet private weak var speakerNameLabel: UILabel!
    @IBOutlet private weak var applicantsAmountLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    
    @IBOutlet private weak var descTitleLabel: UILabel!
    @IBOutlet private weak var descContentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel
            .set(\.font, to: .app_eventDetailTime)
            .set(\.textColor, to: .app_eventDetailTime)
        topicLabel
            .set(\.font, to: .app_eventDetailTopic)
            .set(\.textColor, to: .app_text)
        
        speakerNameLabel
            .set(\.font, to: .app_eventDetailInfo)
            .set(\.textColor, to: .app_text)
        applicantsAmountLabel
            .set(\.font, to: .app_eventDetailInfo)
            .set(\.textColor, to: .app_text)
        addressLabel
            .set(\.font, to: .app_eventDetailInfo)
            .set(\.textColor, to: .app_text)
        
        descTitleLabel
            .set(\.font, to: .app_eventDetailDescTitle)
            .set(\.textColor, to: .app_text)
        descContentLabel
            .set(\.font, to: .app_eventDetailDescContent)
            .set(\.textColor, to: .app_text)
    }
}
