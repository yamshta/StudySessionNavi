//
//  CalendarCollectionViewCell.swift
//  UIComponent
//
//  Created by Shunya Yamashita on 2018/05/12.
//

import UIKit

final class SessionListCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        backgroundColor = .white
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true

        setupTopContainer()
        setupMiddleContainer()
        setupBottomContainer()
    }

    private func setupTopContainer() {
        let topContainerStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.alignment = .fill
            stackView.distribution = .fill
            stackView.spacing = 10
            stackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            stackView.isLayoutMarginsRelativeArrangement = true
            return stackView
        }()

        let headerStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .top
            stackView.distribution = .fill
            stackView.spacing = 15
            return stackView
        }()

        let tagStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .leading
            stackView.distribution = .fillEqually
            stackView.spacing = 2
            return stackView
        }()

        let fromStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .top
            stackView.distribution = .fill
            stackView.spacing = 6
            return stackView
        }()

        let toStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .top
            stackView.distribution = .fill
            stackView.spacing = 6
            return stackView
        }()

        let busInfoStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.alignment = .leading
            stackView.distribution = .fill
            stackView.spacing = 2
            return stackView
        }()

        let typeImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = .groupTableViewBackground
            return imageView
        }()
        headerStackView.addArrangedSubview(typeImageView)
        typeImageView.translatesAutoresizingMaskIntoConstraints = false
        typeImageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        typeImageView.heightAnchor.constraint(equalToConstant: 45).isActive = true

        let titleLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .groupTableViewBackground
            label.text = "≪たびのすけ≫1号 東京・横浜⇒大阪・三ノ宮 4列スタンダード"
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.numberOfLines = 0
            return label
        }()
        headerStackView.addArrangedSubview(titleLabel)

        for _ in 1...5 {
            let tagLabel = UILabel()
            tagLabel.layer.cornerRadius = 2
            tagLabel.clipsToBounds = true
            tagLabel.backgroundColor = .groupTableViewBackground
            tagLabel.translatesAutoresizingMaskIntoConstraints = false
            tagLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
            tagStackView.addArrangedSubview(tagLabel)
        }

        let fromHeaderLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .gray
            label.text = "乗"
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 10)
            label.layer.cornerRadius = 2
            label.clipsToBounds = true
            label.textAlignment = .center
            return label
        }()
        fromStackView.addArrangedSubview(fromHeaderLabel)
        fromHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        fromHeaderLabel.widthAnchor.constraint(equalToConstant: 28).isActive = true
        fromHeaderLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true

        let fromPlatformLabel: UILabel = {
            let fromAttributedString = NSMutableAttributedString(string: "東京駅八重洲口前（2番のりば）（23:00） → 横浜駅東口（23:50）", attributes: [
                .font: UIFont(name: "HiraKakuProN-W6", size: 14.0)!,
                .foregroundColor: UIColor.blue
                ])
            fromAttributedString.addAttributes([
                .font: UIFont(name: "HiraKakuProN-W3", size: 14.0)!,
                .foregroundColor: UIColor.black
                ], range: NSRange(location: 15, length: 9))
            fromAttributedString.addAttributes([
                .font: UIFont(name: "HiraKakuProN-W3", size: 14.0)!,
                .foregroundColor: UIColor.black
                ], range: NSRange(location: 30, length: 7))

            let label = UILabel()
            label.backgroundColor = .groupTableViewBackground
            label.attributedText = fromAttributedString
            label.numberOfLines = 0
            return label
        }()
        fromStackView.addArrangedSubview(fromPlatformLabel)

        let toHeaderLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .gray
            label.text = "降"
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 10)
            label.layer.cornerRadius = 2
            label.clipsToBounds = true
            label.textAlignment = .center
            return label
        }()
        toStackView.addArrangedSubview(toHeaderLabel)
        toHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        toHeaderLabel.widthAnchor.constraint(equalToConstant: 28).isActive = true
        toHeaderLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true

        let toPlatformLabel: UILabel = {
            let toAttributedString = NSMutableAttributedString(string: "高速長岡京（翌05:53） → 名神高槻（06:13） → 名神茨木（06:19） → 千里中央（06:31） → ハービスOSAKA（07:10） → 神戸三宮（08:00）", attributes: [
                .font: UIFont(name: "HiraKakuProN-W3", size: 14.0)!,
                .foregroundColor: UIColor.black
                ])
            toAttributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: NSRange(location: 0, length: 5))
            toAttributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: NSRange(location: 16, length: 4))
            toAttributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: NSRange(location: 30, length: 4))
            toAttributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: NSRange(location: 44, length: 4))
            toAttributedString.addAttributes([
                .font: UIFont(name: "HiraKakuProN-W6", size: 14.0)!,
                .foregroundColor: UIColor.blue
                ], range: NSRange(location: 58, length: 9))
            toAttributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: NSRange(location: 77, length: 4))

            let label = UILabel()
            label.backgroundColor = .groupTableViewBackground
            label.attributedText = toAttributedString
            label.numberOfLines = 0
            return label
        }()
        toStackView.addArrangedSubview(toPlatformLabel)

        let totalTimeLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .groupTableViewBackground
            label.text = "乗車時間：8時間20分（バスタ新宿〜大阪梅田）"
            label.font = UIFont.systemFont(ofSize: 12)
            label.numberOfLines = 0
            return label
        }()
        busInfoStackView.addArrangedSubview(totalTimeLabel)

        let crewCountLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .groupTableViewBackground
            label.text = "乗務員数：2名"
            label.font = UIFont.systemFont(ofSize: 12)
            label.numberOfLines = 0
            return label
        }()
        busInfoStackView.addArrangedSubview(crewCountLabel)

        topContainerStackView.addArrangedSubview(headerStackView)
        topContainerStackView.addArrangedSubview(tagStackView)
        topContainerStackView.addArrangedSubview(fromStackView)
        topContainerStackView.addArrangedSubview(toStackView)
        topContainerStackView.addArrangedSubview(busInfoStackView)
        addSubview(topContainerStackView) { (view) -> ([NSLayoutConstraint]) in
            [
                view.topAnchor.constraint(equalTo: topAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
                view.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
        }
    }

    private func setupMiddleContainer() {}
    private func setupBottomContainer() {}
}
