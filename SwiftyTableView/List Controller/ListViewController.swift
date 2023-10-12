//
//  TripListViewController.swift
//  SwiftyTableView
//
//  Created by Lorenzo Limoli on 12/10/23.
//  Copyright © 2023 Lorenzo Limoli. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    var sectionControllers = [SectionController](){
        didSet{ tableView.reloadData() }
    }
    
    var largeTitle = UINavigationItem.LargeTitleDisplayMode.always {
        didSet{ setupNavigationTitle() }
    }
    
    private var registerCells: (([CellRegistration]) -> Void)?
    private var cellRegistrations: [CellRegistration]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.prefetchDataSource = self
        setupCellRegistration()
        setupNavigationTitle()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionControllers.count
    }
    
    
    private func setupNavigationTitle() {
        navigationController?.navigationBar.prefersLargeTitles = largeTitle == .always
        navigationItem.largeTitleDisplayMode = largeTitle
    }
}

// MARK: CellRegistration
extension ListViewController {
    private func setupCellRegistration() {
        registerCells = { cellRegistrations in
            cellRegistrations.forEach{
                type(of: $0).register(in: self.tableView)
            }
        }
        cellRegistrations.map{ registerCells?($0) }
        cellRegistrations = nil
    }
    
    func registerCells(_ cellRegistrations: [CellRegistration]) {
        guard let registerCells else {
            self.cellRegistrations = cellRegistrations
            return
        }
        registerCells(cellRegistrations)
    }
}

// MARK: HEADER
extension ListViewController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        sectionController(at: section).delegate?
            .tableView?(tableView, viewForHeaderInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        sectionController(at: section).delegate?
            .tableView?(tableView, heightForHeaderInSection: section) ?? tableView.sectionHeaderHeight
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionController(at: section).dataSource.tableView?(tableView, titleForHeaderInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        sectionController(at: section).delegate?.tableView?(tableView, willDisplayHeaderView: view, forSection: section)
    }
}

// MARK: Footer
extension ListViewController {
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        sectionController(at: section).delegate?
            .tableView?(tableView, heightForFooterInSection: section) ?? tableView.sectionFooterHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        sectionController(at: section).delegate?
            .tableView?(tableView, viewForFooterInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        sectionController(at: section).dataSource.tableView?(tableView, titleForFooterInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        sectionController(at: section).delegate?.tableView?(tableView, willDisplayFooterView: view, forSection: section)
    }
}

// MARK: Cells
extension ListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionController(at: section).dataSource
            .tableView(tableView, numberOfRowsInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        sectionController(at: indexPath).dataSource
            .tableView(tableView, cellForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        sectionController(at: indexPath).delegate?
            .tableView?(tableView, heightForRowAt: indexPath) ?? tableView.rowHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sectionController(at: indexPath).delegate?
            .tableView?(tableView, didSelectRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        sectionController(at: indexPath).delegate?
            .tableView?(tableView, willDisplay: cell, forRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        sectionController(at: indexPath).delegate?
            .tableView?(tableView, didEndDisplaying: cell, forRowAt: indexPath)
    }
}

// MARK: PREFETCHING
extension ListViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]){
        apply(.prefetch, to: indexPaths)
    }

    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]){
        apply(.cancel, to: indexPaths)
    }
}

// MARK: HELPERS
private extension ListViewController {
    private func sectionController(at index: Int) -> SectionController{ sectionControllers[index] }
    private func sectionController(at index: IndexPath) -> SectionController{ sectionControllers[index.section] }
    
    private enum PrefetchOperation{
        case prefetch, cancel
    }
    
    private func apply(_ operation: PrefetchOperation, to indexes: [IndexPath]){
        let sectionGroups = Dictionary(grouping: indexes, by: \.section)
        let action: (UITableViewDataSourcePrefetching, UITableView, [IndexPath]) -> Void = operation == .prefetch ?
        { $0.tableView($1, prefetchRowsAt: $2) } :
        { $0.tableView?($1, cancelPrefetchingForRowsAt: $2) }
        sectionGroups.forEach{ section, indexes in
            guard let dsp = sectionController(at: section).dataSourcePrefetching else { return }
            action(dsp, tableView, indexes)
        }
    }
}
