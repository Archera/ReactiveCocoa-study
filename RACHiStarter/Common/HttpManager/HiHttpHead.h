//
//  HiHttpHead.h
//  HistarterProject
//
//  Created by 刘彬彬 on 15/1/16.
//  Copyright (c) 2015年 刘彬彬. All rights reserved.
//

#ifndef HistarterProject_HiHttpHead_h
#define HistarterProject_HiHttpHead_h
#define URL_prefix @"http://test.histarter.com"
#define URL_NEWPrefix @"http://testapi.histarter.com/api"
//外网地址
#define loginTest__prefix @"http://61.153.100.195:8080/app"

//新地址 2015.12.15
#define URL_DecemberApi @"http://112.124.56.195:8080/api"
//http://192.168.0.112:8081/api
//登录接口
#define loginApi_PUT ([NSString stringWithFormat:@"%@%@",URL_DecemberApi, @"/login"])

//人才列表接口
#define talentsList_Post ([NSString stringWithFormat:@"%@%@",URL_DecemberApi, @"/user"])

//人才详情
#define talentsListDetailInfo_Get ([NSString stringWithFormat:@"%@%@",URL_DecemberApi, @"/user"])

//团队列表
#define companyList_Post ([NSString stringWithFormat:@"%@%@",URL_DecemberApi, @"/company"])

//团队详情
#define companyListDetailInfo_Get companyList_Post

//职位列表
#define positionList_Post ([NSString stringWithFormat:@"%@%@",URL_DecemberApi, @"/job"])

//职位详情
#define positionListDetailInfo_Get positionList_Post

//关注人才
#define talentsBeFollow_Put talentsList_Post

//关注团队
#define companyBeFollow_Put companyList_Post

//投递简历
#define resumeToCompany_Post positionList_Post

//投递简历状态
#define resumeToCompanyState_Put positionList_Post

//职位查询接口
#define queryPosition_Post positionList_Post

//文章列表
#define stageList_Post ([NSString stringWithFormat:@"%@%@",URL_DecemberApi, @"/article"])

//文章top滚动视图
#define stageTopList_Post ([NSString stringWithFormat:@"%@%@",stageList_Post, @"/top"])

//文章详情
#define stageDetailInfo_Get stageList_Post

//增加一次点击量
#define stageBeClicked_put stageList_Post

//收藏的团队列表
#define companyIsFollowList_Post companyList_Post

//收藏的人才列表
#define talentsIsFollowList_Post talentsList_Post

//个人详情
#define peopleMyInfo talentsList_Post

//修改个人信息接口(性别,漫游目的,身份角色,创业经验,出生日期,所在省份,所在城市,工作年限,我的标签,我期望的团队特质)
#define changeSelfInfo_Put talentsList_Post

//修改个人基本信息接口（名称,头像,签名,身份角色）
#define changeSelfBaseInfo_Put talentsList_Post

//修改个人信息关联信息接口（个人简介，教育背景，工作经历）
#define changeSelfAboutInfo_Put talentsList_Post

//获取个人信息能力展示信息
#define getSelfPortfolio_Get talentsList_Post

//修改个人信息能力展示信息
#define changeSelfPortfolio_Put talentsList_Post

//职位申请状态
#define positionaApplyForState_Get ([NSString stringWithFormat:@"%@%@",positionList_Post, @"/resume/my/send"])

//我收到的简历
#define positionLookForState_Get ([NSString stringWithFormat:@"%@%@",positionList_Post, @"/resume/my/released"])

//修改密码
#define userModifypwd_Put ([NSString stringWithFormat:@"%@%@",URL_DecemberApi, @"/user"])

//取得绑定手机短信验证码
#define UserGetMessage ([NSString stringWithFormat:@"%@%@",URL_DecemberApi, @"/user/tel/getBindTelNote"])//收短信

//绑定手机
#define bindUserNumber ([NSString stringWithFormat:@"%@%@",URL_DecemberApi, @"/user/tel/bindTel"])

#pragma mark -- 直招服务接口

//优选团队
#define zzCompanyList_Get ([NSString stringWithFormat:@"%@%@",URL_DecemberApi, @"/zhizhao/company"])

//精选人才
#define zzTalentsList_Get ([NSString stringWithFormat:@"%@%@",URL_DecemberApi, @"/zhizhao/user"])

//文章评论
#define articleComment_Put ([NSString stringWithFormat:@"%@%@",URL_DecemberApi, @"/article"])

//精选人才详细
#define zzTalentsDetailInfo_Get zzTalentsList_Get

//直招报名
#define zzApply_Put ([NSString stringWithFormat:@"%@%@",URL_DecemberApi, @"/zhizhao/user/apply"])

//直招简历
#define zzResume_Put ([NSString stringWithFormat:@"%@%@",URL_DecemberApi, @"/zhizhao/user/resume/target"])

//三方登录 (qq,weibo,wechat)
#define otherLogin_post(A) ([NSString stringWithFormat:@"%@/login/%@/mobile/callback",URL_DecemberApi, A])

//获取登录信息接口
#define myInfo_Get ([NSString stringWithFormat:@"%@%@",URL_DecemberApi, @"/user/0/myInfo"])

//#define GetCompanyList @"http://192.168.0.105:8081/api/company"
#define GetCompanyList ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/company/list/"])//团队列表 companyName传公司名字搜索公司ID
#define GetPeopleList ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/people/list/"])//人才列表 condition
#define TalentsDetail ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/people/"])//人才详情
#define GetForumList ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/forum/list"])//吐槽社区主题帖列表
#define UserRegisterAPP ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/user/register"])//注册

#define UserLoginApp ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/login"]) //登录
#define TeamPositionList ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/jobs/list/company"]) //团队职位列表
#define TeamFenList ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/company/follow/list"]) //团队粉丝列表
#define TeamDiscussionList ([NSString stringWithFormat:@"%@%@",URL_prefix, @"/company/comment/list"]) //团队讨论区列表
#define TeamStation ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/company/get"])// 团队小站/company/get/公司ID
#define CompanyJobs ([NSString stringWithFormat:@"%@%@",URL_prefix, @"/jobs/get"]) //公司招聘职位

#define AcitivityList ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/event/list"])//活动列表
#define ForumReplyList ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/forum/reply/list"])//社区回帖
#define ForumTopicList ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/forum/topic/get"])//社区回帖
#define RecruitList ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/jobs/list"])//招聘列表
#define RecruitDetailList ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/jobs/get"])//招聘职位详情
#define clectionTeam ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/company/follow"])//收藏团队
#define clectionTalents ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/people/follow"])//收藏人才
#define clectionPosition ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/jobs/follow"])//收藏职位
#define updateUserInfo ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/people/updateInfo"])//修改个人信息
#define addCompanyCommit ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/company/comment/add"])//添加团队评论
#define companyCommitList ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/company/find/comment/list"])//获取团队评论
#define companyCommentUp ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/company/comment/up"])//公司评论点赞
#define addPeopleCommit ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/people/comment/add"])//添加人才评论
#define peopleCommitList ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/people/find/comment/list"])//获取个人评论
#define companyHotCommitList ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/company/get/hot/comment/list"])//获取公司热门评论
#define peopleHotCommitList ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/people/get/hot/comment/list"])//获取个人热门评论
#define ForumTopicReply ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/forum/topic/reply/add"])//社区回帖评论
#define SystemNotifyList ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/notify/my/all/list"])//获取我所有的通知
#define ClearSystemNotify ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/notify/clear"])//清空当前用户的通知
#define SystemNotifyReadAll ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/notify/read/all"])//将所有通知改为已读
#define SystemAllNewNotify ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/notify/my/new/count"])//获取新通知数量
#define resumeToCompany ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/jobs/send/resume"])//投递简历
#define personalInfo ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/people/get/myInfo"])//个人中心
#define chineseAllCity ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/area/list"])//获取全国城市接口
#define myResume ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/people/get/resume"])//我的简历userId
#define squaremsgLit ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/app/squaremsg/list"])//广场列表 带参数mid=1 广场详情
#define squaremsgZan ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/app/squaremsg/saveFavour"])//app/squaremsg/saveFavour?mid=17广场点赞
#define squaremsgComment ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/app/squaremsg/saveComment"])//app/squaremsg/saveComment?mid=17&touid=2&toname=sss&content=dede212121 广场评价
#define sharePTT ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/app/squaremsg/save"])//app/squaremsg/save?type=5&targetId=2&targetIds=2&targetName=ff type=5职位分享 type=6团队分享  type=7人才分享 type=0&content=文字内容广场-发布图文-1 type=1&content=文字内容&img=http://&img=...
#define squaremsgReleaseInfo ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/app/squaremsg/saveComment"])///app/squaremsg/saveComment?mid=17&touid=2&toname=sss&content=dede212121 发布动态

//resume/my/received  查看投递简历
#define resumeSendresume ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/resume/my/received"])//resume/get/sendresume 查看收到简历
#define bindUserNumberSenderCode ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/note/bind/user"])
///note/bind/user?tel=18616143779  绑定手机发送验证码

#define userModifypwd ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/user/modifypwd"])
//user/modifypwd?oldpassword=1qazxsw2&password=1qazxsw23&replypassword=1qazxsw23  修改密码


//people/get/myInfo  获取个人信息

#define resumeNo ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/resume/no"])
//resume/no 拒绝面试

#define resumeYes ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/resume/yes"])
//resume/yes/{id} 邀请面试
#define squaremsgDelete ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/app/squaremsg/delete"])
//app/squaremsg/delete?id=1  广场删除自己发布的消息

#define histarterReLogin ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/public/checkToken"])
//判断是否需要重新登录  public/checkToken

#define userRegisterByPlant ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/user/registerByPlant"])
//user/registerByPlant 三方登录

#define dictGet ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/dict/get"])
///dict/get  获取筛选数据

#define squaremsgDelComment ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/app/squaremsg/delComment"])
//app/squaremsg/delComment?commentid=1 删除评论

#define peopleAll ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/people/getAll"])

#define updatePeoplePortfolio ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/people/update/peoplePortfolio"])
#define shareTalentURL ([NSString stringWithFormat:@"%@", @"http://www.histarter.com/html5/people"])
//www.histarter.com/wechat/people/{peopleId}  朋友圈分享人才
#define shareCompanyURL ([NSString stringWithFormat:@"%@", @"http://www.histarter.com/html5/company"])
#define shareJobURL ([NSString stringWithFormat:@"%@", @"http://www.histarter.com/html5/job"])
#define notsBindUser ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/note/bind/user"]) //绑定手机发送验证码
#define notsSendMsgNote ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/note/sendMsgNote"])
//note/sendMsgNote?toId=1 向服务器发送通知
#define userUpdatehx ([NSString stringWithFormat:@"%@%@",loginTest__prefix, @"/user/updatehx"])
// /user/updatehx更新环信密码

//文章列表
#define stagesList ([NSString stringWithFormat:@"%@%@",URL_NEWPrefix, @"/article"])
////apitest.histarter.com/api/article/:articleId/comment
#define STAGEAPI @"http://112.124.56.195:8080/api/article"

//文章留言列表
#define stageCommentList(A) ([NSString stringWithFormat:@"%@/%ld/comment",STAGEAPI, A])
#define stageCommentLists STAGEAPI
typedef enum
{
    UserRegisterType = 0,               //普通用户注册
    UserLoginType,                      //用户登录
    UserGetMessageEnum,                 //收短信
    UserRegisterAppEnum,                //注册
    GetCompanyListType,                 //获取公司列表
    GetPeopleListType,                  //获取人才列表
    GetForumListType,                   //吐槽社区主题帖列表
    GetTeamPositionList,                //团队职位列表
    GetTeamFenList,                     //团队粉丝列表
    GetTeamDiscussionList,              //团队讨论区列表
    GetTalentsDetail,
    GetTeamStation,                     //团队小站
    GetCompanyJobs,                     //公司招聘职位
    GetTalentsDetailInfo,               //人才详情
    GetAcitivityList,                   //活动列表
    GetForumReplyList,                  //社区回帖
    GetForumTopicList,                  //帖子详细内容
    GetRecruitList,                     //招聘列表
    GetRecruitDetailList,               //招聘职位详情
    GetClectionTeam,                    //收藏团队
    GetClectionTalents,                 //收藏人才
    GetClectionPosition,                //收藏职位
    PostIsFollowCompanyList,            //收藏的团队列表
    PostIsFollowTalentsList,            //收藏的人才列表
    GetUpdateUserInfo,                  //修改个人信息
    GetUpdateUserBaseInfo,              //修改个人基本信息
    GetChangeSelfAboutInfo,             //修改个人信息关联信息接口（个人简介，教育背景，工作经历）
    GetSelfPortfolio,                   //获取个人信息能力展示信息
    GetChangeSelfPortfolio,             //修改个人信息能力展示信息
    
    
    GetAddCompanyCommit,                //添加团队评论
    GetCompanyCommitList,               //获取团队评论
    GetCompanyCommentUp,                //公司评论点赞
    GetAddPeopleCommit,                 //添加人才评论
    GetPeopleCommitList,                //获取个人评论
    GetcompanyHotCommitList,            //获取公司热门评论
    GetPeopleHotCommitList,             //获取个人热门评论
    GetForumTopicReply,                 //社区回帖评论
    GetSystemNotifyList,                //获取我所有的通知
    GetClearSystemNotify,               //清空当前用户的通知
    GetSystemNotifyReadAll,             //将所有通知改为已读
    GetSystemAllNewNotify,              //获取新通知数量
    GetResumeToCompany,                 //投递简历
    GetResumeToCompanyState,            //投递简历状态
    GetPersonalInfo,                    //获取个人信息
    GetChineseAllCity,                  //获取全国城市接口
    GetMyResume,                        //我的简历
    GetSquaremsgLit,                    //广场列表
    GetSquaremsgZan,                    //广场点赞
    GetSquaremsgComment,                //广场评价
    GetSharePTT,                        //职位，团队，人才
    GetSquaremsgReleaseInfo,            //发布动态
    GetResumeReceived,                  //查看投递简历
    GetResumeSendresume,                //查看收到简历
    GetbindUserNumberSenderCode,        //绑定手机发送验证码
    GetBindUserNumber,                  //绑定手机
    GetUserModifypwd,                   //修改密码
    GetPeopleMyInfo,                    //获取个人信息
    GetResumeNo,                        //拒绝面试
    GetResumeYes,                       //邀请面试
    GetSquaremsgDelete,                 //广场删除自己发布的消息
    GetHistarterReLogin,                //判断是否需要重新登录
    GetUserRegisterByPlant,             //三方登录
    GetMyInfo,
    GetDictGet,                         //获取筛选数据
    GetSquaremsgDelComment,             //删除评论
    GetNotsBindUser,                    //绑定手机发送验证码
    GetPeopleAll,
    GetUpdatePeoplePortfolio,
    GetShareTalentURL,                  //朋友圈分享人才
    GetShareCompanyURL,
    GetShareJobURL,
    GetNotsSendMsgNote,                 //向服务器发送通知
    GetUserUpdatehxet,                  //更新环信密码
    GetStagesList,                      //文章列表
    GetStageTopList,                    //文章top滚动视图
    GetStageDetailInfo,                 //文章详情
    PutStageBeClicked,                  //增加一次点击量
    GetStageCommentList,                //文章留言列表
    GetZZCompanyList,                   //优选团队
    GetZZTalentsList,                   //精选人才
    GetZZTalentsDetailInfoList,         //精选人才详细
    PutarticleComment,                  //文章评论
    PutZzApple,                         //直招报名
    PutZzResume,                        //直招简历
    GetNull,                            //占位符
}HttpRequestType;
#endif
