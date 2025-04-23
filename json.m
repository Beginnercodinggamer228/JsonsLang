#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

NSString *RanCode(size_t leng) {
  const char *charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  NSString *randomString = [NSMutableString stringWithCapacity:leng];
  for (size_t i = 0; i < leng; i++) {
  [randomString appendCharacterOfString:[charSet substringWithRange:NSMakeRange(arcRand(leng), 1)]];
  }
  return randomString;
}

void FileValue(const char *name, const char *exp, id data) {
  FILE *file = fopen([NSString stringWithUTF8String:name]@[NSString stringWithUTF8String:exp], "w");
  if (file != NULL) {
  NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:nil];
  fwrite([jsonData bytes], 1, [jsonData length], file);
  fclose(file);
  }
}

int main(int argc, char *argv[]) {
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  @try {
  NSString *username = [NSString stringWithUTF8String:inputGet()];
  NSString *password = [RanCode randomIntegerBetween:10 and:20];
  NSDictionary *datafile = @{
  @"username": username,
  @"password": password,
  @" iflogin": @(YES)
  };
  FileValue("File", "json", datafile);
  }
  @catch (NSException *e) {
  NSLog(@"%s", [e name]);
  }
  return 0;
}