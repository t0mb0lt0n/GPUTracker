//
//  CustomDescriptionView.swift
//  GPUTracker
//
//  Created by Alexander on 05.04.2024.
//

import UIKit

final class CustomDescriptionView: UIView {
    var tableView = CustomTableView()
    var tableView2 = CustomTableView()

    
    var testLabel1: UILabel = {
        let label = UILabel()
        label.text = "Test label text"
        label.backgroundColor = .orange
        return label
    }()
    
    var testLabel2: UILabel = {
        let label = UILabel()
        label.text = "Test label text1"
        label.backgroundColor = .systemPink
        return label
    }()
    
    var testLabel3: UILabel = {
        let label = UILabel()
        label.text = "Test label text2"
        label.backgroundColor = .blue
        return label
    }()
    
    var testLabel4: UILabel = {
        let label = UILabel()
        label.text = "Test label text3"
        label.backgroundColor = .red
        return label
    }()
    
    let segmentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .orange
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.bounces = true
        scrollView.contentSize = CGSize(width: Int(UIScreen.main.bounds.width), height: 10000)
        //scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    let testScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .lightGray
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.bounces = true
        scrollView.contentSize = CGSize(width: Int(UIScreen.main.bounds.width) * 5, height: 1000)
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    func addLabel(position: CGFloat, label: UILabel) {
        let screeWith = UIScreen.main.bounds.width - 20
        label.frame = CGRect(x: screeWith * position, y: 0, width: screeWith, height: 200)
        testScrollView.addSubview(label)
    }
    
    func addScrollView(position: CGFloat, scroll: UIScrollView) {
        let screeWith = UIScreen.main.bounds.width - 20
        scroll.frame = CGRect(x: screeWith * position, y: 0, width: screeWith, height: 1100)
        testScrollView.addSubview(scroll)
    }
    
    func addTableView(position: CGFloat, table: CustomTableView) {
        let screeWith = UIScreen.main.bounds.width - 20
        table.frame = CGRect(x: screeWith * position, y: 0, width: screeWith, height: 1100)
        testScrollView.addSubview(table)
        table.reloadData()
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .gray
        tableView.tag = 0
        tableView2.tag = 1
        tableView.dataSource = self
        tableView2.dataSource = self
        setupView()
        setupConstraints()
        addScrollView(position: 0, scroll: segmentScrollView)
        addTableView(position: 1, table: tableView)
        addTableView(position: 2, table: tableView2)
        addLabel(position: 3, label: testLabel1)
        addLabel(position: 4, label: testLabel2)
        //addTableView(position: 3, table: tableView2)
        //addLabel(position: 3, label: testLabel3)
        //addLabel(position: 4, label: testLabel4)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    final private func setupView() {
//        tableView.dataSource = self
//        tableView2.dataSource = self
        [
        testScrollView,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    final private func setupConstraints() {
        NSLayoutConstraint.activate([
            testScrollView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 0
            ),
            testScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            testScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            testScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension CustomDescriptionView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
        case 0:
            print("1")
            return 1
        case 1:
            print("2")
            return 10
        default:
            return 0
        }
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        switch tableView.tag {
        case 0:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "GPUInfoCellView",
                for: indexPath
            ) as? GPUInfoCellView
            else { fatalError() }
     
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "GPUInfoCellView",
                for: indexPath
            ) as? GPUInfoCellView
            else { fatalError() }
     
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "ManufacturerCell",
                for: indexPath
            ) as? ManufacturerCell
            else { fatalError() }
     
            return cell
        }
    }
    
}
