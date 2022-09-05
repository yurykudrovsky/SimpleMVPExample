//
//  SomePresenter.swift
//  SimpleMVPExample
//
//  Created by Yuriy Kudrovskiy on 05.09.2022.
//

import Foundation

// MARK: - Constants

private enum Constans {
    static let viewTitleValue = "Simple MVP Example"
    static let buttonTitleValue = "Update Model"
}

// MARK: - Implementation

final class SomePresenter {
    
    // MARK: - Private properties
    
    private weak var view: SomeView?
    private var model: SomeModel? {
        willSet {
            guard let value = self.model?.value else { return }
            view?.setValue(text: value)
        }
    }
    
    // MARK: - Lifecycle
    
    init(with view: SomeView?) {
        self.view = view
    }
    
}

// MARK: - Public

extension SomePresenter {
    
    func onViewDidLoad() {
        view?.setTitle(text: Constans.viewTitleValue)
        view?.setButtonTitle(text: Constans.buttonTitleValue)
    }
    
    func didTapButton() {
        updateModel()
    }
    
}

// MARK: - State managment

private extension SomePresenter {
    
    func updateModel() {
        SomeService.shared.fetchSomeData {
            model = $0
        }
    }
    
}
