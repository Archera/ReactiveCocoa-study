//
//  HiHttpManager.m
//  HistarterProject
//
//  Created by 刘彬彬 on 15/1/16.
//  Copyright (c) 2015年 刘彬彬. All rights reserved.
//https://github.com/AFNetworking/AFNetworking

#import "HiHttpManager.h"
#import "UIImageView+AFNetworking.h"
@implementation HiHttpManager
@synthesize task;
+ (HiHttpManager *)sharedInstance {
    static HiHttpManager *hetHttpManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^(){
        hetHttpManager = [HiHttpManager manager];
        [hetHttpManager.securityPolicy setAllowInvalidCertificates:YES];
        hetHttpManager.responseSerializer.acceptableContentTypes = [hetHttpManager.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/plain", @"text/html", @"text/xml"]];
    });
    return hetHttpManager;
}

/**
 *  取消请求
 */
- (void)httpCancel
{
    if (task) {
        [task cancel];
    }
}

/**
 *  把post请求转化为get请求的url，方便直接从网页访问
 *
 *  @param type   请求唯一标示符
 *  @param params 请求发送的参数
 */
- (void)DlogRequestUrl:(HttpRequestType)type
            withParams:(NSDictionary *)params
{
    NSArray *array = [params allKeys];
    NSString *url = [self getPostURL:type withDic:params];
    if(array && [array isKindOfClass:[NSArray class]] && ![array isEqual:[NSNull null]])
    {
        for(NSInteger index = 0; index < array.count; index ++)
        {
            NSString *key = [array objectAtIndex:index];
            NSString *value = [params objectForKey:key];
            if ([key isEqualToString:@"#"]) {
                
            }
            else
            {
                if (index!=0) {
                    url = [url stringByAppendingFormat:@"&%@=%@",key,value];
                }
                else
                {
                    url = [url stringByAppendingFormat:@"?%@=%@",key,value];
                }
            }
        }
        DLog(@"request=%@",url);
    }
}

/**
 *  发送post请求
 *
 *  @param type    请求唯一标示符
 *  @param params  请求发送的参数
 *  @param success 请求成功返回的json
 *  @param failure 错误返回信息
 */
- (void)sendPostHttp:(HttpRequestType)type
              params:(NSDictionary *)params
             success:(void (^)(NSDictionary * response))success
             failure:(void (^)  (NSError *error, NSInteger statusCode))failure
{
    //去掉key为@“#”的元素
    NSMutableDictionary *dic_ = [NSMutableDictionary dictionaryWithDictionary:params];
//    if (type!=UserRegisterType&&type!=UserLoginType)
//    {
//        if (![[dic_ allKeys] containsObject:@"token"]&&[[HiStarterData sharedclassname].loginDic objectForKey:@"token"]!=nil) {
//            [dic_ setObject:[NSString stringWithFormat:@"%@",[[HiStarterData sharedclassname].loginDic objectForKey:@"token"]] forKey:@"token"];
//        }
//    }
    
    
//    if (type == GetUserModifypwd || type == GetUpdateUserInfo || type == GetUpdateUserBaseInfo ||type == GetChangeSelfAboutInfo || type == GetChangeSelfPortfolio || type == GetSelfPortfolio) {
//        for (NSString *key in dic_.allKeys)
//        {
//            if ([key isEqualToString:@"#"]) {
//                [dic_ removeObjectForKey:@"#"];
//            }
//        }
//    }
    for (NSString *key in dic_.allKeys)
    {
        if ([key isEqualToString:@"#"]) {
            [dic_ removeObjectForKey:@"#"];
        }
    }
    
    //把请求链接打印出来，跟请求操作无关！
    [self DlogRequestUrl:type withParams:params];
    self.hiClassHttp = [self typeClass:type];
    
    //设置header
    if (![[HiLoginData sharedclassname].loginToken isEqualToString:@""] ) {
        [self.requestSerializer setValue:[HiLoginData sharedclassname].loginToken forHTTPHeaderField:@"Authorization"];
    }
    
    if (self.hiClassHttp == PUTHIHTTP) {
        task = [self PUT:[self getPostURL:type withDic:params] parameters:dic_ success:^(AFHTTPRequestOperation *operation, id responseObject)
                {
                    DLog(@"Success");
                    if ([responseObject isKindOfClass:[NSDictionary class]]) {
                        success(responseObject);
                    }
                } failure:^(AFHTTPRequestOperation *operation, NSError *error){
                    failure(error, [[operation response] statusCode]);
                }];
    }
    else if (self.hiClassHttp == GETHIHTTP)
    {
        task = [self GET:[self getPostURL:type withDic:params] parameters:[self filterParams:dic_] success:^(AFHTTPRequestOperation *operation, id responseObject)
                {
                    DLog(@"Success");
                    if ([responseObject isKindOfClass:[NSDictionary class]]) {
                        success(responseObject);
                    }
                } failure:^(AFHTTPRequestOperation *operation, NSError *error){
                    failure(error, [[operation response] statusCode]);
                }];
    }
    else
    {
        task = [self POST:[self getPostURL:type withDic:params] parameters:[self filterParams:dic_] success:^(AFHTTPRequestOperation *operation, id responseObject)
                {
                    DLog(@"Success");
                    if ([responseObject isKindOfClass:[NSDictionary class]]) {
                        success(responseObject);
                    }
                } failure:^(AFHTTPRequestOperation *operation, NSError *error){
                    failure(error, [[operation response] statusCode]);
                }];
    }
}


/**
 *  根据type判断请求是get、post、put
 *
 *  @param type HttpRequestType
 *
 *  @return HttpClass
 */
- (HttpClass)typeClass:(HttpRequestType)type
{
    switch (type) {
        case UserLoginType:
        case GetClectionTalents:
        case GetClectionTeam:
        case PutStageBeClicked:
        case GetUserModifypwd:
        case GetBindUserNumber:
        case GetUpdateUserInfo:
        case GetUpdateUserBaseInfo:
        case GetChangeSelfAboutInfo:
        case GetChangeSelfPortfolio:
        case PutarticleComment:
        case PutZzApple:
        case PutZzResume:
            return PUTHIHTTP;
            break;
        case GetTalentsDetailInfo:
        case GetTeamStation:
        case GetRecruitDetailList:
        case GetResumeToCompanyState:
        case GetStageDetailInfo:
        case GetPeopleMyInfo:
        case GetResumeReceived:
        case GetResumeSendresume:
        case UserGetMessageEnum:
        case GetSelfPortfolio:
        case GetZZCompanyList:
        case GetZZTalentsList:
        case GetZZTalentsDetailInfoList:
        case GetMyInfo:
            return GETHIHTTP;
            break;
        case GetPeopleListType:
//        case GetUserModifypwd:
            return POSTHIHTTP;
            break;
            
        default:
            return POSTHIHTTP;
            break;
    }
}

/**
 *  发送包含图片,语音等文件的请求
 *
 *  @param type    请求唯一标示符
 *  @param params  请求发送的参数
 *  @param success 请求成功返回的json
 *  @param failure 错误返回信息
 */
- (void)senderImagePostHttp:(HttpRequestType)type
                     params:(NSDictionary *)params
                    success:(void (^)(NSDictionary * response))success
                    failure:(void (^)  (NSError *error, NSInteger statusCode))failure
{
    [self DlogRequestUrl:type withParams:params];
    
    __block int i = 0;
    __block NSArray *array;
    __block NSString *str1;
    __block NSString *str2;
    task = [super POST:[self getPostURL:type withDic:params] parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>formData)
            {
                if ([[params objectForKey:@"pic"] isKindOfClass:[NSArray class]]) {
                    array = [params objectForKey:@"pic"];
                    for (i=0; i<array.count; i++) {
                        NSData *file = [array objectAtIndex:i];
                        //            [formData appendPartWithFileURL:file name:@"image" error:nil];
                        //            [formData appendPartWithFormData:file name:@"image" ];
                        str1 = [NSString stringWithFormat:@"image%d",i];
                        str2 = [NSString stringWithFormat:@"image%d.jpg",i];
                        [formData appendPartWithFileData:file name:str1 fileName:str2 mimeType:@"image/jpge"];
                    }
                }
                if ([[params allKeys] containsObject:@"completeCarPhotos"])
                {
                    if ([[params objectForKey:@"completeCarPhotos"] isKindOfClass:[NSArray class]])
                    {
                        NSArray *comArray = [NSArray arrayWithArray:[params objectForKey:@"completeCarPhotos"]];
                        NSDictionary *dic = [comArray lastObject];
                        for (NSString *key in dic) {
                            str1 = [NSString stringWithFormat:@"%@",key];
                            str2 = [NSString stringWithFormat:@"%@.jpg",key];
                            [formData appendPartWithFileData:[dic objectForKey:key] name:str1 fileName:str2 mimeType:@"image/jpge"];
                        }
                    }
                }
                if ([[params allKeys] containsObject:@"cafPath"]) {
                    NSData *file = [params objectForKey:@"cafPath"];
                    [formData appendPartWithFileData:file name:@"cafPath" fileName:@"cafPath.caf" mimeType:@"cafPath/caf"];
                }
                else
                {
                    
                }
                
            }
               success:^(AFHTTPRequestOperation *operation, id responseObject)
            {
                DLog(@"Success");
                if ([responseObject isKindOfClass:[NSDictionary class]]) {
                    success(responseObject);
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error){
                failure(error, [[operation response] statusCode]);
            }];
}

/**
 *  检查网络状况
 *
 *  @param status 返回网络标志位
 */
- (void)cheakNet:(void (^)(AFNetworkReachabilityStatus * status))status
{
    NSURL *baseURL = [NSURL URLWithString:@"http://www.baidu.com/"];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    
    NSOperationQueue *operationQueue = manager.operationQueue;
    // 检测网络连接的单例,网络变化时的回调方法
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
    
    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
    [manager.reachabilityManager startMonitoring];
    
//    // 检测网络连接的单例,网络变化时的回调方法
//    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        DLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
//    }];
}

//投递简历
- (NSString*)resumeRequest:(NSDictionary*)dic
{
    NSString* requestURL = resumeToCompany_Post;
    requestURL = [NSString stringWithFormat:@"%@/%@/send/resume",requestURL,[dic objectForKey:@"#"]];
    for (NSString *key in dic.allKeys)
    {
        if ([key isEqualToString:@"#"]) {
            
        }
        else
        {
            requestURL = [NSString stringWithFormat:@"%@",requestURL];
        }
    }
    return requestURL;
}

//修改密码
- (NSString*)userModifypwdRequest:(NSDictionary*)dic
{
    NSString* requestURL = userModifypwd_Put;
    requestURL = [NSString stringWithFormat:@"%@/%@/password",requestURL,[dic objectForKey:@"#"]];
    for (NSString *key in dic.allKeys)
    {
        if ([key isEqualToString:@"#"]) {
            
        }
        else
        {
            requestURL = [NSString stringWithFormat:@"%@",requestURL];
        }
    }
    return requestURL;
}

/**
 *  nil
 *
 *  @param type 正在请求的url
 *
 *  @return 返回请求用的URL
 */
- (NSString*)getPostURL:(HttpRequestType)type withDic:(NSDictionary*)dic
{
    NSString* requestURL=[[NSString alloc] init];
    if (type==GetCompanyListType)
    {
        requestURL = companyList_Post;
    }
    else if (type == GetTeamStation)
    {
        requestURL = companyListDetailInfo_Get;
    }
    else if (type == GetRecruitList)
    {
        requestURL = positionList_Post;
    }
    else if (type == GetRecruitDetailList)
    {
        requestURL = positionListDetailInfo_Get;
    }
    else if (type==GetPeopleListType)
    {
        requestURL = talentsList_Post;
    }
    else if (type == GetTalentsDetailInfo)
    {
        requestURL = talentsListDetailInfo_Get;
    }
    else if (type == GetClectionTalents)
    {
        //关注人才
        requestURL = talentsBeFollow_Put;
    }
    else if (type == GetClectionTeam)
    {
        //关注团队
        requestURL = companyBeFollow_Put;
    }
    else if (type == GetResumeToCompany)
    {
        //投递简历
        requestURL = [self resumeRequest:dic];
        DLog(@"requestURL is :%@",requestURL);
        return requestURL;
    }
    else if (type == GetResumeToCompanyState)
    {
        //查看投递简历状态
        requestURL = resumeToCompanyState_Put;
    }
    else if (type == GetStagesList)
    {
        //文章列表
        requestURL = stageList_Post;
    }
    else if (type == GetStageTopList)
    {
        //文章top滚动视图
        requestURL = stageTopList_Post;
    }
    else if (type == GetStageDetailInfo)
    {
        //文章详情
        requestURL = stageDetailInfo_Get;
    }
    else if (type == GetPeopleMyInfo)
    {
        //个人详情
        requestURL = peopleMyInfo;
    }
    else if (type == GetResumeReceived)
    {
        //职位申请状态
        requestURL = positionaApplyForState_Get;
    }
    else if (type == GetResumeSendresume)
    {
        //我收到的简历
        requestURL = positionLookForState_Get;
    }
    else if (type == GetUserModifypwd)
    {
        //修改密码
        requestURL = [self userModifypwdRequest:dic];
        return requestURL;
    }
    else if (type == UserGetMessageEnum)
    {
        //取得绑定手机短信验证码
        requestURL = UserGetMessage;
    }
    else if (type == GetBindUserNumber)
    {
        //绑定手机
        requestURL = bindUserNumber;
    }
    else if (type == GetUpdateUserInfo)
    {
        //修改个人信息
        requestURL = changeSelfInfo_Put;
    }
    else if (type == GetUpdateUserBaseInfo)
    {
        //修改个人基本信息
        requestURL = changeSelfBaseInfo_Put;
    }
    else if (type == GetChangeSelfAboutInfo)
    {
        //修改个人信息关联信息接口（个人简介，教育背景，工作经历）
        requestURL = changeSelfAboutInfo_Put;
    }
    else if (type == GetSelfPortfolio)
    {
        //获取个人信息能力展示信息
        requestURL = getSelfPortfolio_Get;
    }
    else if (type == GetChangeSelfPortfolio)
    {
        //修改个人信息能力展示信息
        requestURL = changeSelfPortfolio_Put;
    }
    else if (type == GetZZCompanyList)
    {
        //优选团队
        requestURL = zzCompanyList_Get;
    }
    else if (type == GetZZTalentsList)
    {
        //精选人才
        requestURL = zzTalentsList_Get;
    }
    else if (type == PutarticleComment)
    {
        //文章评论
        requestURL = articleComment_Put;
    }
    else if (type == PutZzApple)
    {
        //直招报名
        requestURL = zzApply_Put;
    }
    else if (type == PutZzResume)
    {
        //直招简历
        requestURL = zzResume_Put;
    }
    else if (type == GetUserRegisterByPlant)
    {
    }
    else if (type == GetMyInfo)
    {
        //
        requestURL = myInfo_Get;
    }
    else if (type == GetZZTalentsDetailInfoList)
    {
        requestURL = zzTalentsDetailInfo_Get;
    }
    else if (type == PostIsFollowCompanyList)
    {
        requestURL = companyIsFollowList_Post;
    }
    else if (type == PostIsFollowTalentsList)
    {
        requestURL = talentsIsFollowList_Post;
    }
    else if (type == GetForumListType)
    {
        requestURL = GetForumList;
    }
    else if (type == PutStageBeClicked)
    {
        requestURL = stageBeClicked_put;
    }
    else if (type == UserRegisterAppEnum)
    {
        requestURL = UserRegisterAPP;
    }
    else if (type == UserLoginType)
    {
        requestURL = loginApi_PUT;
//        requestURL = UserLoginApp;
    }
    else if (type == GetTeamPositionList)
    {
        requestURL = TeamPositionList;
    }
    else if (type == GetTeamFenList)
    {
        requestURL = TeamFenList;
    }
    else if (type == GetTeamDiscussionList)
    {
        requestURL = TeamDiscussionList;
    }
    else if (type == GetTalentsDetail)
    {
        requestURL = TalentsDetail;
    }
    else if (type == GetCompanyJobs)
    {
        requestURL = CompanyJobs;
    }
    else if (type == GetAcitivityList)
    {
        requestURL = AcitivityList;
    }
    else if (type == GetForumReplyList)
    {
        requestURL = ForumReplyList;
    }
    else if (type == GetForumTopicList)
    {
        requestURL = ForumTopicList;
    }
    else if (type == GetClectionPosition)
    {
        requestURL = clectionPosition;
    }
    else if (type == GetAddCompanyCommit)
    {
        requestURL = addCompanyCommit;
    }
    else if (type == GetCompanyCommitList)
    {
        requestURL = companyCommitList;
    }
    else if (type == GetCompanyCommentUp)
    {
        requestURL = companyCommentUp;
    }
    else if (type == GetAddPeopleCommit)
    {
        requestURL = addPeopleCommit;
    }
    else if (type == GetPeopleCommitList)
    {
        requestURL = peopleCommitList;
    }
    else if (type == GetcompanyHotCommitList)
    {
        requestURL = companyHotCommitList;
    }
    else if (type == GetPeopleHotCommitList)
    {
        requestURL = peopleHotCommitList;
    }
    else if (type == GetForumTopicReply)
    {
        requestURL = ForumTopicReply;
    }
    else if (type == GetSystemNotifyList)
    {
        requestURL = SystemNotifyList;
    }
    else if (type == GetClearSystemNotify)
    {
        requestURL = ClearSystemNotify;
    }
    else if (type == GetSystemNotifyReadAll)
    {
        requestURL = SystemNotifyReadAll;
    }
    else if (type == GetSystemAllNewNotify)
    {
        requestURL = SystemAllNewNotify;
    }
    else if (type == GetPersonalInfo)
    {
        requestURL = personalInfo;
    }
    else if (type == GetChineseAllCity)
    {
        requestURL = chineseAllCity;
    }
    else if (type == GetSquaremsgLit)
    {
        requestURL = squaremsgLit;
    }
    else if (type == GetSquaremsgZan)
    {
        requestURL = squaremsgZan;
    }
    else if (type == GetSquaremsgComment)
    {
        requestURL = squaremsgComment;
    }
    else if (type == GetSharePTT)
    {
        requestURL = sharePTT;
    }
    else if (type == GetbindUserNumberSenderCode)
    {
        requestURL = bindUserNumberSenderCode;
    }
    else if (type == GetSquaremsgDelete)
    {
        requestURL = squaremsgDelete;
    }
    else if (type == GetHistarterReLogin)
    {
        requestURL = histarterReLogin;
    }
    else if (type == GetDictGet)
    {
        requestURL = dictGet;
    }
    else if (type == GetSquaremsgDelComment)
    {
        requestURL = squaremsgDelComment;
    }
    else if (type == GetPeopleAll)
    {
        requestURL = peopleAll;
    }
    else if (type == GetResumeYes)
    {
        requestURL = resumeYes;
    }
    else if (type == GetResumeNo)
    {
        requestURL = resumeNo;
    }
    else if (type == GetUpdatePeoplePortfolio)
    {
        requestURL = updatePeoplePortfolio;
    }
    else if (type == GetNotsBindUser)
    {
        requestURL = notsBindUser;
    }
    else if (type == GetNotsSendMsgNote)
    {
        requestURL = notsSendMsgNote;
    }
    else if (type == GetUserUpdatehxet)
    {
        requestURL = userUpdatehx;
    }
    else if (type == GetStageCommentList)
    {
        requestURL = stageCommentLists;//stageCommentList([[dic objectForKey:@"articleId"] integerValue]);
//        return requestURL;
    }
    
    for (NSString *key in dic.allKeys)
    {
        if ([key isEqualToString:@"#"]) {
            requestURL = [NSString stringWithFormat:@"%@/%@",requestURL,[dic objectForKey:@"#"]];
        }
        else
        {
            requestURL = [NSString stringWithFormat:@"%@",requestURL];
        }
    }
    
    if (type == GetTeamStation) {
        requestURL = [NSString stringWithFormat:@"%@/all",requestURL];
    }
    else if (type == GetClectionTalents||type == GetClectionTeam)
    {
        requestURL = [NSString stringWithFormat:@"%@/follow",requestURL];
    }
    else if (type == GetResumeToCompanyState)
    {
        requestURL = [NSString stringWithFormat:@"%@/send/resume",requestURL];
    }
    else if (type == PutStageBeClicked)
    {
        requestURL = [NSString stringWithFormat:@"%@/click",requestURL];
    }
    else if (type == GetPeopleMyInfo)
    {
        requestURL = [NSString stringWithFormat:@"%@/myInfo",requestURL];
    }
    else if (type == GetUpdateUserInfo)
    {
        requestURL = [NSString stringWithFormat:@"%@/info",requestURL];
    }
    else if (type == GetUpdateUserBaseInfo)
    {
        requestURL = [NSString stringWithFormat:@"%@/basic",requestURL];
    }
    else if (type == GetChangeSelfAboutInfo)
    {
        requestURL = [NSString stringWithFormat:@"%@/info/about",requestURL];
    }
    else if (type == GetSelfPortfolio || type == GetChangeSelfPortfolio)
    {
        requestURL = [NSString stringWithFormat:@"%@/portfolio",requestURL];
    }
    else if (type == PutarticleComment)
    {
        requestURL = [NSString stringWithFormat:@"%@/comment",requestURL];
    }
    else if (type == GetZZTalentsDetailInfoList)
    {
        requestURL = [NSString stringWithFormat:@"%@/resume",requestURL];
    }
    else if (type == GetStageCommentList)
    {
        requestURL = [NSString stringWithFormat:@"%@/comment",requestURL];
    }
    DLog(@"requestURL is :%@",requestURL);
    return requestURL;
}

- (NSMutableDictionary*)filterParams:(NSMutableDictionary*)dic
{
    if ([dic.allKeys containsObject:@"articleId"]) {
        [dic removeObjectForKey:@"articleId"];
    }
    return dic;
}
@end
