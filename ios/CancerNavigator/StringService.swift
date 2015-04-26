//
//  StringService.swift
//  CancerNavigator
//
//  Created by David Young-chan Kay on 4/26/15.
//  Copyright (c) 2015 David Young-chan Kay. All rights reserved.
//

import Foundation

public class StringService {
  public func getString(key: String) -> String {
    return NSBundle.mainBundle().localizedStringForKey(key, value: "", table: nil)
  }
}
