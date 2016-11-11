//
//  HiLoginViewModel.h
//  RACHiStarter
//
//  Created by 刘彬彬 on 15/11/17.
//  Copyright © 2015年 刘彬彬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HiRequestManager.h"

@interface HiLoginViewModel : HiRequestManager
@property (nonatomic, copy)   NSString *userName;
@property (nonatomic, copy)   NSString *password;
@property (nonatomic, strong) RACSubject *successObject;
@property (nonatomic, strong) RACSubject *failureObject;
@property (nonatomic, strong) RACSubject *errorObject;

- (id) buttonIsValid;
- (void)login;
@end
