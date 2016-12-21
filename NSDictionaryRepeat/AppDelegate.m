//
//  AppDelegate.m
//  NSDictionaryRepeat
//
//  Created by Slava on 21.12.16.
//  Copyright © 2016 Slava. All rights reserved.
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    Уровень Ученик.
//      Создайте класс студент со свойствами имя, фамилия и фраза приветствия.
//      Создайте 10 - 15 объектов этого класса.
    NSMutableArray * studentObject = [[NSMutableArray alloc] init];
    NSMutableArray * studentKeys = [[NSMutableArray alloc] init];
    for (int i = 0; i < 15; i++) {
        Student *stud = [Student new];
        stud.name = [NSString stringWithFormat:@"Alex%d", i];
        stud.lastName = [NSString stringWithFormat:@"Panfilov%d", i];
        stud.hiSay = [NSString stringWithFormat:@"%dHi!", i];
        [studentObject addObject:stud];
        [studentKeys addObject:[NSString stringWithFormat:@"%@ %@", [studentObject[i] name], [studentObject[i] lastName]]];
    }

//      Теперь мы создадим дикшинари типо школьный журнал, где ключ будет фамилия + имя, а значение сам студент.
    NSDictionary * dictionary = [NSDictionary dictionaryWithObjects:studentObject forKeys:studentKeys];
#pragma mark -SchoolBOy-
//      Распечатайте дикшинари
    NSLog(@"=================================");
    NSLog(@"%@ ", [dictionary allKeys]);
    
//    Уровень Студент.
//      В цикле пройдемся по всем ключам в дикшинари и распечатаем имя и фамилию каждого студента + его фразу приветствия.
    NSLog(@"=================================");
#pragma mark -Student-
    for (NSString *key in dictionary) {
        NSLog(@"%@ My name is %@",[dictionary[key] hiSay],key);
    }
//    Уровень Мастер.
//      Чтобы сделать тоже самое но по какому-то порядку, отсортируйте массив ключей по возрастанию и выведите приветствие каждого студента из дикшинари, но уже по отсортированному списку.
    NSLog(@"=================================");
#pragma mark -Master-
    NSArray * sortedDictionary =[dictionary keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [[obj1 lastName] compare:[obj2 lastName]];
    }];
    
    for (int i = 0; i <[sortedDictionary count]; i++) {
        
        
        id obj = [sortedDictionary objectAtIndex:i];
        
        NSLog(@"%@ My name is %@",[dictionary[obj] hiSay], obj);
    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
