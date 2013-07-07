MPColorChooseViewController
===========================

WHAT IS IT:

MPColorChooseViewController is class, that have ability tu realtime changing color of almost everything. First idea of creation was to change color realtime of navigationBar



HOW TO USE IT:

You have to add this on view controller. This example is in appDelegate.m file, but you can add it wherever you want
  
    MPColorChooseViewController *colorchoose = [[MPColorChooseViewController alloc] init];
    [colorchoose setDelegate:self];
    [colorchoose.view setFrame:CGRectMake(0, 100, 250, 140)];
    [self.window.rootViewController.view addSubview:colorchoose.view];

and next add delegating method for catching color 

-(void)colorDidChanged:(UIColor*)color{
    
    NSLog(@"%@",color);
    [self.navigationController.navigationBar setTintColor:color];

}
