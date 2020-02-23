//
//  ResultRouter.swift
//  DesafioBCI
//
//  Created by Carlos Sepulveda on 23-02-20.
//  Copyright (c) 2020 Carlos Sepulveda. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol ResultRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ResultDataPassing
{
  var dataStore: ResultDataStore? { get }
}

class ResultRouter: NSObject, ResultRoutingLogic, ResultDataPassing
{
  weak var viewController: ResultViewController?
  var dataStore: ResultDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: ResultViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: ResultDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
