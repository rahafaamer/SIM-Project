////
////  MartialStatusService.swift
////  SIM
////
////  Created by SSS on 10/19/17.
////  Copyright © 2017 SSS. All rights reserved.
////
//
//import Foundation
//import AWSDynamoDB
//import AWSS3
//import AWSSQS
//import AWSSNS
//
//class MartialStatusService {
//    
//    let updateMapperConfig : AWSDynamoDBObjectMapperConfiguration?
//    let dynamoDBObjectMapper : AWSDynamoDBObjectMapper?
//    
//    init() {
//        dynamoDBObjectMapper = AWSDynamoDBObjectMapper.default()
//        updateMapperConfig = AWSDynamoDBObjectMapperConfiguration()
//        updateMapperConfig?.saveBehavior = .updateSkipNullAttributes
//    }
//    
//    
//    func Save(maritalStatus:MaritalStatus,onComplete:@escaping (Int) -> Void){
//        maritalStatus.uuid = UUID().uuidString
//        setNilValueToObject(maritalStatus: maritalStatus)
//        dynamoDBObjectMapper?.save(maritalStatus,configuration:updateMapperConfig, completionHandler: { (err) in
//            if err == nil {
//                onComplete(1)
//            }else{
//                print(err.debugDescription)
//                onComplete(0)
//            }
//        })
//    }
//    
//    func load(hashKey:String,onComplete:@escaping (MaritalStatus?,Int) -> Void) {
//        dynamoDBObjectMapper?.load(MaritalStatus.self, hashKey: hashKey, rangeKey: nil, completionHandler: { (result, err) in
//            if err != nil {
//                onComplete(nil,0)
//            } else {
//                if let resultMaritalStatus = result as? MaritalStatus {
//                    onComplete(resultMaritalStatus,1)
//                }else{
//                    onComplete(nil,0)
//                }
//            }
//        })
//    }
//    
//    func update(hashKey:String,updatedMaritalStatusObject:MaritalStatus,onComplete:@escaping (Int) -> Void)  {
//        self.load(hashKey: hashKey) { (oldMaritalStatus,status) in
//            if status == 1{
//                let updatedMaritalStatus = oldMaritalStatus
//                updatedMaritalStatus?.maritalStatusName = updatedMaritalStatusObject.maritalStatusName
//                self.Save(maritalStatus: updatedMaritalStatus! , onComplete: { (state) in
//                    if state == 1 {
//                        onComplete(1)
//                    }else{
//                        onComplete(0)
//                    }
//                })
//            }else{
//                onComplete(0)
//            }
//        }
//    }
//    func setNilValueToObject(maritalStatus:MaritalStatus) {
//        if maritalStatus.maritalStatusName == "" {
//            maritalStatus.maritalStatusName = nil
//        }
//        
//    }
//    
//
//    
//}
