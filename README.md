MPColorChooseViewController
===========================

WHAT IS IT:

MPColorChooseViewController is class, that have ability tu realtime changing color of almost everything. First idea of creation was to change color realtime of navigationBar



HOW TO IMPLEMENT IT:

Just download example project to see what's going on.
For implementing in your own project do next steps.
You have to add this on view controller. This example is in appDelegate.m file, but you can add it wherever you want

``` 
MPColorChooseViewController *colorchoose = [[MPColorChooseViewController alloc] init];
[colorchoose setDelegate:self];
[colorchoose.view setFrame:CGRectMake(0, 100, 250, 170)];
[self.window.rootViewController.view addSubview:colorchoose.view];
```
and next add delegating method for catching color 

```
-(void) colorDidChanged: (UIColor*) color{
    NSLog(@"%@",color);
    [self.navigationController.navigationBar setTintColor:color];
}
```
also you need import .h file and also add MPColorChooseDelegate to .h file for working



HOW TO USE IT:

Just move sliders to change colors.
You can also tap on buttons < and > for change values for every slider at once. 
Also you can tap on button and move finger for quicker sliding everyone


