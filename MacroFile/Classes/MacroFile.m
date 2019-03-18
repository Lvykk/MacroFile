//
//  MacroDocument.m
//  LibDemo
//
//  Created by Lvyk on 2019/3/18.
//  Copyright © 2019 Lvyk. All rights reserved.
//
/**
 * 常用宏的定义文件
 */

#import <Foundation/Foundation.h>

#ifndef MacroFile_h
#define MacroFile_h

/*! 1、获取APP的名字 */
#define GET_APP_Name [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"]

/*! 2、获取APP的版本号 */
#define GET_APP_Version [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

/*! 3、获取App短式版本号 */
#define GET_APP_VersionShort [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"]

/*! 4、使用BALocalizedString检索本地化字符串 */
#define GET_LocalizedString(key, comment) NSLocalizedString(key, comment)

/*! 5、获取AppDelegate */
#define GET_APPDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

/*! 6、获取sharedApplication */
#define GET_SharedApplication [UIApplication sharedApplication]

/*! 7、获取temp */
#define GET_PathTemp NSTemporaryDirectory()

/*! 8、获取沙盒 Document */
#define GET_PathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

/*! 9、获取沙盒 Cache */
#define GET_PathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

/*!10、用safari打开URL */
#define OpenUrl(url) [DQL_SharedApplication openURL:[NSURL URLWithString:url] options:@{} completionHandler:nil]

/*!11. 获取App的BundleId*/
#define GET_BundleId [[NSBundle mainBundle] bundleIdentifier]

/*!12. 获取屏幕的尺寸*/
#define GET_Screen [UIScreen mainScreen].bounds

/*!13. 获取屏幕的宽*/
#define GET_ScreenWidth [UIScreen mainScreen].bounds.size.width

/*!14. 获取屏幕的高*/
#define GET_ScreenHeight [UIScreen mainScreen].bounds.size.height

/**!15.导航栏高度**/
#define GET_TopBarHeight (StartBarFrame.size.height + 44)

/**!16.状态栏**/
#define GET_StartBarFrame [[UIApplication sharedApplication] statusBarFrame]

/**!17.状态栏高度**/
#define GET_StartBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

/**!18.TabBar高度**/
#define GET_TabBarHeight (Device_Is_iPhoneX||Device_Is_iPhoneXS_Max||Device_Is_iPhoneXR?83.0:49.0)

/**!19.判断机型**/
#define Device_Is_iPhone5_5S_SE ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define Device_Is_iPhone6_7_8 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define Device_Is_iPhone6_7_8P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define Device_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define Device_Is_iPhoneXS_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
#define Device_Is_iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)

/**!20.View 圆角和加边框**/
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

/**!21.View 圆角**/
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

/**!21.是否空对象**/
#define IS_NULL_CLASS(OBJECT) [OBJECT isKindOfClass:[NSNull class]]

/**!22.获取图片资源**/
#define GET_Image(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

/**!23.获取图片资源(大图片)**/
#define GET_ImagePath(imageName,format) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:imageName ofType:format]]

/**!23.取色值相关的方法*/ 
#define RGB(r,g,b)          [UIColor colorWithRed:(r)/255.f \
green:(g)/255.f \
blue:(b)/255.f \
alpha:1.f]

#define RGBA(r,g,b,a)       [UIColor colorWithRed:(r)/255.f \
green:(g)/255.f \
blue:(b)/255.f \
alpha:(a)]

//日志打印
#ifdef DEBUG
#define NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#warning 当前为Release模式
#define NSLog(...) fprintf(stderr, "当前为Release模式\n");
#endif

#endif
