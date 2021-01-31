

import '../preference.dart';
import 'languageEn.dart';
import 'languageFr.dart';

enum languageEnum {english,french} //todo add supported languages here
const languageCacheKey="language";

// todo set primary language using lanuage selection screen
setPrimaryLanguage(var languageenum){
  switch(languageenum){
    case languageEnum.english: Preference.setString(languageCacheKey, languageEnum.english.toString());
    break;
    case languageEnum.french: Preference.setString(languageCacheKey, languageEnum.french.toString());
    break;
    default:
  }
}

getPrimaryLanguage() {
   String cacheLanguage=Preference.getString(languageCacheKey);
   if(cacheLanguage==null){
     return LanguageEn();
   }


   if(cacheLanguage==languageEnum.english.toString()){
     return LanguageEn();
   }else  if(cacheLanguage==languageEnum.french.toString()){
     return LanguageFr();
   }else{
    // AppLogger.print("Language is not set");
     return LanguageEn(); //todo set default language here
   }
   return LanguageFr();
}

bool isPrimaryLanguageset(){
  if(Preference.getString(languageCacheKey)==null){
    return false;
  }else{
    return true;
  }
}



