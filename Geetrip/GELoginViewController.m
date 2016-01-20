//
//  GELoginViewController.m
//  Geetrip
//
//  Created by addinghome on 16/1/18.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "GELoginViewController.h"
#import "GEAccountManager.h"
#import "GEUserViewController.h"

@interface GELoginViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *emailTextField, *passwordTextField;

@end

@implementation GELoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"登录";
    self.view.backgroundColor = [UIColor backGrayColor];
    [self loadUI];
}

- (void)loadUI
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapedView)];
    [self.view addGestureRecognizer:tap];
    
    if ([WXApi isWXAppInstalled] && [WXApi isWXAppSupportApi]){
    }
    [self loadWeiXinLoginView];

    
    [self loadTextfeild];
}

- (void)loadWeiXinLoginView
{
    UIButton *weiXinLoginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 65 + 25, SCREEN_WIDTH, 45)];
    weiXinLoginButton.tag = 100;
    weiXinLoginButton.backgroundColor = [UIColor weixinBackColor];
    [weiXinLoginButton setTitle:@"用微信帐号登录" forState:UIControlStateNormal];
    [weiXinLoginButton setImage:[UIImage imageNamed:@"wxlogo"] forState:UIControlStateNormal];
    [weiXinLoginButton addTarget:self action:@selector(sendAuthRequest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:weiXinLoginButton];
    
    
    UILabel *andLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 65 + 85, SCREEN_WIDTH, 20)];
    andLabel.text = @"或";
    andLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:andLabel];
    
}

- (void)loadTextfeild
{
    CGFloat height;
    if ([WXApi isWXAppInstalled] && [WXApi isWXAppSupportApi]){
        height = 120 + 65;
    }else{
        
        height = 120 + 65;
    }
    
    NSArray *array = [NSArray arrayWithObjects:@"邮箱", @"密码", nil];
    CGRect frame1 = CGRectMake(0, 0, 65, 40);
    CGRect frame2 = CGRectMake(0, height, SCREEN_WIDTH, 40);
    for (int i=0; i<[array count]; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:frame1];
        label.text = [NSString stringWithFormat:@"    %@:",[array objectAtIndex:i]];
        label.font = [UIFont systemFontOfSize:15];
        label.backgroundColor = [UIColor whiteColor];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:frame2];
        textField.placeholder = [NSString stringWithFormat:@"请输入%@", [array objectAtIndex:i]];
        if(i==0){
            textField.keyboardType = UIKeyboardTypeEmailAddress;
            _emailTextField = textField;
        }else{
            _passwordTextField = textField;
        }
        
        textField.leftView = label;
        textField.leftViewMode = UITextFieldViewModeAlways;
        
        textField.rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 40)];
        textField.rightViewMode = UITextFieldViewModeAlways;
        
        textField.textAlignment = NSTextAlignmentRight;
        textField.font = [UIFont systemFontOfSize:13];
        textField.tag = 1000+i;
        textField.delegate = self;
        textField.textColor = [UIColor lightGrayColor];
        textField.backgroundColor = [UIColor whiteColor];
        if (i==1) {
            textField.secureTextEntry = YES;
        }
        
        [self.view addSubview:textField];
        
        frame1.origin.y += 40;
        frame2.origin.y+= 40;
        
        if (i<[array count]-1) {
            UILabel *underLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, frame2.origin.y-0.4, SCREEN_WIDTH-10, 0.4)];
            underLineLabel.backgroundColor = [UIColor lightGrayColor];
            [self.view addSubview:underLineLabel];
        }
    }
    
    [self loadLoginButtonWithStartY:frame2.origin.y + 30];
}

- (void)loadLoginButtonWithStartY:(CGFloat)startY
{
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, startY, SCREEN_WIDTH, 45)];
    loginButton.backgroundColor = [UIColor geetripGreenColor];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:@"还没有帐号？注册一个"];
    NSRange range = NSMakeRange(0, attString.string.length);
    [attString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    [attString addAttribute:NSUnderlineColorAttributeName value:[UIColor textColor] range:range];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor textColor] range:range];
    
    UIButton *registerButton = [[UIButton alloc] initWithFrame:CGRectMake(0, loginButton.frame.origin.y + 60, SCREEN_WIDTH, 40)];
    [registerButton setAttributedTitle:attString forState:UIControlStateNormal];
    registerButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [registerButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(registerLog) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
}

#pragma mark - 用户交互
- (void)sendAuthRequest
{
    NSLog(@"开始登录");
    [GEAccountManager loginWithLoginType:LXMThirdLoginTypeWeChat return:^{
        
    } success:^{
        [self performSelector:@selector(loginSuccess) withObject:nil afterDelay:0.5];
    } failure:^(NSError *error) {
        
    }];
}

- (void)login
{
    
}

- (void)registerLog
{
    
}

- (void)loginSuccess
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)tapedView
{
    [_passwordTextField resignFirstResponder];
    [_emailTextField resignFirstResponder];
}

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
