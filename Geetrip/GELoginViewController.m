//
//  GELoginViewController.m
//  Geetrip
//
//  Created by addinghome on 16/1/18.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "GELoginViewController.h"

@interface GELoginViewController ()

@end

@implementation GELoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"登录";
    
}

- (void)loadUI
{
    if ([WXApi isWXAppInstalled] && [WXApi isWXAppSupportApi]){
    }
    [self loadWeiXinLoginView];

    
    //[self loadTextfeild];
}

- (void)loadWeiXinLoginView
{
    UIButton *weiXinLoginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 25, SCREEN_WIDTH, 45)];
    weiXinLoginButton.tag = 100;
    [weiXinLoginButton addTarget:self action:@selector(sendAuthRequest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:weiXinLoginButton];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(110, 0, SCREEN_WIDTH - 40 - 80, 45)];
    label.text = @"微信登录";//GDLocalizedString(@"WeChatSignIn", @"Geetrip", nil);
    label.textColor = [UIColor whiteColor];
    [weiXinLoginButton addSubview:label];
    
//    UIView *weixin = [self createViewWithFrame:CGRectMake(60, 2.5, 40, 40) img:@"wxlogo" tag:200 title:nil destName:nil];
//    [weiXinLoginButton addSubview:weixin];
    
//    UILabel *andLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 85, [Help screenWidth], 20)];
//    andLabel.text = GDLocalizedString(@"Or", @"Geetrip", nil);
//    andLabel.textAlignment = NSTextAlignmentCenter;
//    //andLabel.textColor = [UIColor whiteColor];
//    [_mainScrollView addSubview:andLabel];
    
}

//- (void)loadTextfeild
//{
//    individualModel *model = [NSKeyedUnarchiver unarchiveObjectWithFile:[FilePath userPath]];
//    
//    CGFloat height;
//    if ([WXApi isWXAppInstalled] && [WXApi isWXAppSupportApi]){
//        height = 120;
//    }else{
//        
//        height = 30;
//    }
//    
//    NSArray *array = [NSArray arrayWithObjects:GDLocalizedString(@"Email", @"Geetrip", nil), GDLocalizedString(@"Password", @"Geetrip", nil), nil];
//    CGRect frame = CGRectMake(0, height, [Help screenWidth], 40);
//    CGRect frame1 = CGRectMake(20, height, 80, 40);
//    CGRect frame2 = CGRectMake(0, height, [Help screenWidth]-20, 40);
//    for (int i=0; i<[array count]; i++) {
//        UIView *backView = [[UIView alloc] initWithFrame:frame];
//        backView.backgroundColor = [UIColor whiteColor];
//        [_mainScrollView addSubview:backView];
//        
//        UILabel *label = [[UILabel alloc] initWithFrame:frame1];
//        label.text = [NSString stringWithFormat:@"%@:",[array objectAtIndex:i]];
//        label.font = [UIFont systemFontOfSize:15];
//        label.backgroundColor = [UIColor whiteColor];
//        [_mainScrollView addSubview:label];
//        
//        UITextField *textField = [[UITextField alloc] initWithFrame:frame2];
//        textField.placeholder = [NSString stringWithFormat:@"%@%@", GDLocalizedString(@"Please", @"Geetrip", nil), [array objectAtIndex:i]];
//        if(i==0){
//            textField.keyboardType = UIKeyboardTypeEmailAddress;
//        }
//        textField.textAlignment = NSTextAlignmentRight;
//        textField.font = [UIFont systemFontOfSize:13];
//        textField.tag = 1000+i;
//        textField.delegate = self;
//        textField.textColor = [UIColor lightGrayColor];
//        textField.backgroundColor = [UIColor clearColor];
//        if (i==1) {
//            textField.secureTextEntry = YES;
//        }
//        
//        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//        NSString *lastEmail = [userDefaults objectForKey:@"lastEmail"];
//        
//        NSLog(@"最近登录的账号：%@",lastEmail);
//        if (model != nil) {
//            if (i==0) {
//                textField.text = lastEmail;
//            }
//        }
//        [_mainScrollView addSubview:textField];
//        
//        frame.origin.y+=40;
//        frame1.origin.y += 40;
//        frame2.origin.y+= 40;
//        
//        if (i<[array count]-1) {
//            UILabel *underLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, frame.origin.y-0.4, [Help screenWidth]-10, 0.4)];
//            underLineLabel.backgroundColor = [UIColor lightGrayColor];
//            [_mainScrollView addSubview:underLineLabel];
//        }
//    }
//    
//    
//    frame.origin.y += 45;
//    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, frame.origin.y, [Help screenWidth], 45)];
//    loginButton.backgroundColor = [Help color];
//    [loginButton setTitle:GDLocalizedString(@"BigLogin", @"Geetrip", nil) forState:UIControlStateNormal];
//    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
//    loginButton.tag = Login_Button_tag;
//    [_mainScrollView addSubview:loginButton];
//    
//    frame.origin.y += 50;
//    UIButton *registerButton = [[UIButton alloc] initWithFrame:frame];
//    [registerButton setTitle:GDLocalizedString(@"CreateAccount", @"Geetrip", nil) forState:UIControlStateNormal];
//    registerButton.titleLabel.font = [UIFont systemFontOfSize:15];
//    [registerButton setTitleColor:[Help textColor] forState:UIControlStateNormal];
//    [registerButton addTarget:self action:@selector(registerLog) forControlEvents:UIControlEventTouchUpInside];
//    [_mainScrollView addSubview:registerButton];
//    
//    CGFloat width = [Height widthForString:GDLocalizedString(@"CreateAccount", @"Geetrip", nil) height:20 andFont:15];
//    UILabel *registerUnderLabel = [[UILabel alloc] initWithFrame:CGRectMake(([Help screenWidth]-width)/2.0, frame.origin.y+30, width, 0.4)];
//    registerUnderLabel.backgroundColor = [Help textColor];
//    [_mainScrollView addSubview:registerUnderLabel];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
