//
//  HomePresenter.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 09/09/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

protocol IHomeView: class {

}

protocol IHomePresenter {

}

struct HomePresenter: IHomePresenter {

    private(set) weak var view: IHomeView?

}
