/*------------app配置------------*/
const DOMAIN = 'huajian.app';
const APP_NAME = '电影';
const SERVER_API_URL = 'https://$DOMAIN/api';
const DEBUG = false;

/// 设备是否第一次打开
const String STORAGE_DEVICE_ALREADY_OPEN_KEY = 'device_already_open';

/// 首页cacheKey
const String STORAGE_INDEX_NEWS_CACHE_KEY = 'cache_index_news';

/*------------http缓存------------*/
// 是否启用缓存
const CACHE_ENABLE = false;

// 缓存的最长时间，单位（秒）
const CACHE_MAXAGE = 1000;

// 最大缓存数
const CACHE_MAXCOUNT = 100;


/*------------http抓包代理------------*/
// 是否启用代理
const PROXY_ENABLE = false;

/// 代理服务IP
const PROXY_IP = '192.168.1.105';

/// 代理服务端口
const PROXY_PORT = 8866;

/*------------本地持久化配置信息------------*/
/// 用户配置信息
const String STORAGE_USER_PROFILE_KEY = 'user_profile';
const String STORAGE_MASTER_KEY = 'ducafcat_news_app';
const String STORAGE_USER_TOKEN_KEY = 'user_token';
