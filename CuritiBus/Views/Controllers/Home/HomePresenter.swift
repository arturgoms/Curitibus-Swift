//
//  HomeInteractor.swift
//  CuritiBus
//
//  Created by Diego Trevisan Lara on 13/06/2017.
//  Copyright © 2017 Diego Trevisan Lara. All rights reserved.
//

class HomePresenter: IHomePresenter {
    
    weak var view: IHomeView?
    var lineInteractor: LineInteractor
    var stopInteractor: StopInteractor
    
    required init(lineInteractor: LineInteractor, stopInteractor: StopInteractor) {
        self.lineInteractor = lineInteractor
        self.stopInteractor = stopInteractor
    }
    
    func loadUserLines() {
        lineInteractor.getUserLines(success: { lines in
            self.view?.userLinesDidLoad(lines: lines)
        }, error: { error in
            self.view?.userLinesLoadDidFail(error: error)
        })
    }
    
    func addUserLine(line: Line) {
        lineInteractor.addUserLine(line: line)
    }
    
    func deleteUserLine(line: Line) {
        lineInteractor.deleteUserLine(line: line)
    }
    
    func getLineStops(line: Line) {
        
        if let line = line as? UrbsLine {
            
            stopInteractor.getUrbsStops(line: line, success: { stops in
                print(stops)
            })
            
        } else if let line = line as? MetroLine {
            
            stopInteractor.getMetroPaths(line: line, success: { paths in
                
                var count = paths.count
                guard count > 0 else {
                    //sucesso vazio
                    return
                }
                
                // Para cada trajeto, buscar pontos
                for path in paths {
                    self.stopInteractor.getMetroStops(line: line, path: path, success: { courses in
                        count -= 1
                        path.courses = courses
                        if count == 0 { print(paths) }
                        
                    }, error: { error in
                        count -= 1
                        if count == 0 { print(paths) }
                    })
                }
                
            })
            
        }
        
    }
    
    func getLinePaths(line: Line) {
        stopInteractor.getMetroPaths(line: line, success: { paths in
            print(paths)
        })
    }
    
}
