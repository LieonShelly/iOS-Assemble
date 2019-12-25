//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Foundation

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

/// 1.Swift 实现二分搜索算法
extension Array where Element: Comparable {
    public var isSorted: Bool {
        var previousIndex = startIndex
        var currentIndex = startIndex + 1
        while currentIndex != endIndex {
            if self[previousIndex] > self[currentIndex] {
                return false
            }
            previousIndex = currentIndex
            currentIndex = currentIndex + 1
        }
        return true
    }
}

func binarySearch<T: Comparable>(sortedElements: [T], for element: T) -> Bool {
    /// 确保数组是排序的
    assert(sortedElements.isSorted)
    var lo = 0, hi = sortedElements.count - 1
    while lo <= hi {
        let mid = lo + ( hi - lo) / 2
        if sortedElements[mid] == element {
            return true
        } else if sortedElements[mid] < element {
            lo = mid + 1
        } else {
            hi = mid - 1
        }
    }
    return false
}

/// 2. 给定一个整数型数组中有且仅有两个数之和等于目标值，求这两个数在数组中的序号
func twoSums(nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
    for (i, num) in nums.enumerated() {
        if let lastIndex = dict[target - num] {
            return [lastIndex, i]
        } else {
            dict[num] = i
        }
    }
    fatalError("No Valid Output")
}

///3.给出一个字符串，按照单词顺序进行反转，比如如果是 the sky is blue，那么反转后的结果就是 blue is sky  the

func reverseWords(s: String?) -> String? {
    guard  let s = s else {
        return nil
    }
    var strArray = s.split(separator: " ")
    strArray.reverse()
   return strArray.joined(separator: " ")
}

reverseWords(s: "the sky is blue")

/// 链表
class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class List {
    var head: ListNode?
    var tail: ListNode?
    
    //尾插法
    func appendToTail(_ val: Int) {
        if self.tail == nil {
            tail = ListNode(val)
            head = tail
        } else {
            tail!.next = ListNode(val)
            tail = tail!.next
        }
    }
    // 头插法
    func appendToHead(_ val: Int) {
        if self.head == nil {
            head = ListNode(val)
            tail = head
        } else {
            let temp = ListNode(val)
            temp.next = head
            head = temp
        }
    }
}

/// 交换两个变量的值
func swap<T>(_ a: inout T, _ b: inout T) {
    (a, b) = (b, a)
}

func evenSquareNums(form: Int, to: Int) -> [Int] {
    return (0 ... 10).map { $0 * $0}.filter {$0 % 2 == 0}
}

func evenSquareNums1(form: Int, to: Int) -> [Int] {
    var res = [Int]()
    for num in form ... to where num % 2 == 0 {
        res.append(num)
    }
    return res
}

func revertList1(node: ListNode) -> ListNode {
    var last: ListNode?
    var next: ListNode?
    var nodeH: ListNode? = node
    
    while nodeH != nil {
        next = nodeH?.next
        nodeH?.next = last
        last = nodeH
        nodeH = next
    }
    return last!
}

func revertList( node: ListNode) -> ListNode {
    var last: ListNode?
    var next: ListNode?
    var nodeH: ListNode? = node
    
    while nodeH != nil {
        next = nodeH?.next
        nodeH?.next = last
        last = nodeH
        nodeH = next
    }
    return last!
}

let alist = ListNode(1)
let blist = ListNode(2)
let clist = ListNode(3)
let dlist = ListNode(4)
alist.next = blist
blist.next = clist
clist.next = dlist

let newList = revertList(node: alist)
print(newList.val)
print(newList.next?.val)


///  串行: 队列中只能执行一个任务
let q_1 = DispatchQueue(label: "adf")
q_1.async { /// 会把当前任务加入到队列之中，然后立即返回，不等等待任务
    
}
q_1.sync { /// 会把任务加入到队列之中，等当前任务执行完成，线程才会继续运行 - 会阻塞线程
    
}
/// 并行： 队列中可以执行多个任务
let _ = DispatchQueue(label: "", qos: .background, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
/// 系统全局 - 并行
let _ = DispatchQueue.global()

let  queue = OperationQueue()
/// 串行
queue.maxConcurrentOperationCount = 1
/// 并行
queue.maxConcurrentOperationCount = 3


/// <a .*>(\d+|\D+)</a>


extension String {
    func range(from range: NSRange) -> Range<String.Index>? {
        guard let form16 = utf16.index(utf16.startIndex, offsetBy: range.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(form16, offsetBy: range.length, limitedBy: utf16.endIndex),
            let from = String.Index(form16, within: self),
            let to = String.Index(to16, within: self)
            else {
                return nil
        }
        return from ..< to
    }
}

class GCDTImer {
    func test() {
        
    }
}


class StringReverse {
    fileprivate func swap<T>(_ chars: inout [T], _ p: Int, _ q: Int) {
        (chars[p], chars[q]) = (chars[q], chars[p])
    }
    
    fileprivate func _reverse<T>(_ chars: inout [T], _ start: Int, _ end: Int) {
        var start = start, end = end
        while start < end {
            swap(&chars, start, end)
            start += 1
            end -= 1
        }
    }
    
    func reverseWords(s: String) -> String? {
        var chars = Array(s)
        print(chars)
        _reverse(&chars, 0, chars.count - 1)
        return String(chars)
    }
    
}

let reslut = StringReverse().reverseWords(s: "123")
print(reslut ?? "")


class RevertList {
    func revertList(node: ListNode) -> ListNode? {
        var next: ListNode?
        var last: ListNode?
        var nodeH: ListNode? = node
        
        while nodeH != nil {
            
            next = nodeH?.next
            nodeH?.next = last
            last = nodeH
            nodeH = next
        }
        return last
    }
}



let newList1 = RevertList().revertList(node: alist)


class FIbTest {
    func fib(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        var first = 0
        var second = 1
        for _ in 0 ..< n - 1 {
            let sum = first + second
            first = second
            second = sum
        }
        return second
    }
    
    func fib1(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        return fib1(n - 1) + fib1(n - 2)
    }
    
}

/// 设计一个动态数组
class DynamicArray {
    var elements: [Int]
    private var size: Int
    
    init() {
        elements = Array<Int>()
        size = 0
    }
    
    func count() -> Int {
        return size
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }

    func get(_ index: Int) ->  Int? {
        if  index < 0 || index >= size {
            return nil
        }
        return elements[index]
    }
    
    func set(_ element: Int, index: Int) -> Int? {
        if  index < 0 || index >= size {
            return nil
        }
        let old = elements[index]
        elements[index] = element
        return old
    }
    
    func indexOf(_ element: Int) -> Int? {
        for index in 0 ..< elements.count {
            if elements[index] == element {
                return index
            }
        }
        return nil
    }
    
    func contains(_ element: Int) -> Bool {
        return indexOf(element) != nil
    }
    
    func clearAll() {
        size = 0
    }
    
    func add(_ element: Int, index: Int? = nil) {
        if let index = index,  index > 0 || index <= size  {
            for i in (index ..< size - 1).reversed() {
                elements[i + 1] = elements[i]
            }
            size += 1
            elements[index] = element
        } else {
            elements[size] = element
            size += 1
        }
    
    }
    
    func remove(_ index: Int) -> Int? {
        if  index < 0 || index >= size {
            return nil
        }
        let delteElement = elements[index]
        for i in index + 1 ..< size {
            elements[i - 1] = elements[i]
        }
        size -= 1
       return delteElement
    }
}


class RegexTest {
    func test() {
        let arr = ["a", "ds", "的", "我"]
        let pattern = "钢琴|电子琴|翡翠|牡丹|黄花梨手串|郑多燕减肥操|中华古玩网|瑜伽|兰花|桂花树|萨克斯|极品钢琴|宠物狗|桂花|狗粮|酒店预订|酒店|订酒店|北京欢乐谷|携程网酒店预订|上海欢乐谷|千岛湖|广州塔|附近的酒店|乌镇住宿|周庄古镇|白水寨|香港旅游|台儿庄古城|宾馆|天堂寨|杭州西湖|加拿大|天台山|深圳欢乐谷|世界之窗|携程网酒店预|小梅沙|武汉欢乐谷|成都欢乐谷|常州恐龙园|恩施大峡谷|盘锦红海滩|北京旅游|拙政园|汉堡|西塘古镇|天柱山|苏州乐园|上海大巴侧翻|太行山大峡谷|香格里拉酒店|长隆水上乐园|艺龙网酒店预订|深圳世界之窗|天柱山风景区|东方明珠门票|艺龙网酒店预定|携程网|携程旅行网|沂水地下大峡谷|法门寺|如家快捷酒店|华山门票|汉庭快捷酒店|旅游景点推荐|如家酒店官网|上海虹桥机场|维多利亚|北京旅游攻略|深圳海洋世界|旅游景点|香港旅游攻略|峨眉山门票|韩国旅游|长沙世界之窗|京西宾馆|汉庭|旅行社|云南旅游|车票查询|成都旅游|张家界旅游|携程网机票查询|欢乐谷万圣节|康辉旅行社官网|武汉欢乐谷门票|上海旅游|汉庭酒店官网|天天风之旅官网|成都到九寨沟|订票电话|深圳欢乐谷门票|去哪网|丽江旅游|泰国旅游|友乐园|西藏旅游|旅游攻略|新加坡|杭州旅游|旅游|网上订票|澳门旅游攻略|南京旅游|携程旅行|北海旅游|自驾游|如家酒店|康辉旅行社|海底世界|马尔代夫|上海旅游攻略|稻城亚丁|携程|韩国旅游攻略|普吉岛|机票预订|上海旅游景点|十一去哪旅游好|客车|旅游网|迪拜七星级酒店|九寨沟旅游攻略|机场大巴时刻表|欢乐谷门票|去哪儿旅行|天津旅游|厦门旅游|海南旅游|林肯|普吉岛旅游攻略|新加坡旅游攻略|飞机票查询官网|新西兰|台湾旅游|北京旅游景点|七天连锁酒店|订机票|特价机票|乌镇旅游攻略|机票|订票|携程机票|玻尿酸原液|沙县小吃网|怎么画眼线|咖啡|银杏|麻辣烫|啤酒|零食|化妆品代理|木瓜|快餐|服装设计|五粮液|海参|白酒|冰淇淋|牛栏奶粉|防辐射服|纸尿裤|买卖宝货到付款|奢侈品|眼霜|沙县小吃|掌柜钱包|化妆的正确步骤|火锅|星巴克官网|85度c|特色小吃|玉石|壹钱包|手套|买卖宝商城|好奇纸尿裤|晾衣架|眼镜|钻戒|隐形眼镜|妮维雅男士|买卖宝|化妆品批发|生日礼物|美食天下菜谱|御泥坊官网|自助火锅|彩妆|独轮电动车|生日蛋糕|葡萄酒|羊蝎子|小吃车|草莓|普洱茶|美素奶粉|铁观音|花王纸尿裤|小吃|儿童服装|代步车|红酒|美瞳|电动车电池|童装品牌|红酒品牌|童装秋装新款|蜂蜜|小吃大全|小刀电动车|监控摄像头|健身器材|尿不湿|茶叶|厂家网商城|抱枕|de洗面奶|牛油果|茅台酒|隐形眼镜的危害|蛋糕|精油|金龙鱼价格|童装|儿童玩具|饿了吗订餐|美团外卖网|男童装秋装|老年代步车|洗面奶|护肤品|面包|电子烟|自助餐|项链|北大青鸟|sat|金钥匙|英语口语|雅思报名官网|学习英语|gre|学英语|英语学习|雅思|郑大一附院|日语|如何学好英语|顺德长鹿农庄|最萌英语试卷|mba|心理咨询师|怎么学好英语|怎样学好英语|自考本科|美容师培训|专升本|acca|司法考试|高锰酸钾|硫酸铜|韩语学习|长鹿农庄|茶道|自考|英语作文|国考最火职位|考研报名|托福报名官网|会计从业资格证|营养师报考条件|成人高考|新东方烹饪学校|voa慢速英语|睡不着怎么办|会计证|韩语入门|日语学习|在职研究生|二级建造师|斯坦福大学|磷酸|中华会计网|可可英语|氢氧化钠|中级经济师|高一数学必修1|烧烤技术|厨师|广西财政会计网|保保网|新概念英语|一级建造师|安徽会计网|自考本科有用吗|金融学专业介绍|金融学|职业规划|英语听力|考研网|李阳疯狂英语|新东方英语|英语|英语学习软件|人力资源管理|会计|盐酸西替利嗪片|考研吧|我要自学网|考研报名时间|经济学|营养师|初一上册数学|普特英语听力网|哈佛大学|中央空调|净水器|空气净化器|空调|加湿器|电暖器|投影仪|海尔冰箱|摩托罗拉|led|洗衣机|海尔|优米|大金空调|吸尘器|格力空调价格表|格力空调|投影机|海尔洗衣机|电热水器|京东商城手机|优米手机|西门子冰箱|空调什么牌子好|全自动洗衣机|垃圾处理器|烤箱|京东商城手机版|净水器有用吗|西门子洗衣机|手机|智能手机|冰箱|空调遥控器|平板|京东手机商城|海尔电视|电饼铛|美的空调|烤箱烤红薯|沁园净水器|美的电压力锅|海尔商城|净水器十大名牌|平板电脑|平板电脑推荐|惠普|手机商城|华强北|手机贴膜|二手手机|海淘|搬家公司|婚纱摄影|婚纱照|汇通网|租车网|租车|网上申请信用卡|银行利息|神州租车网|信用卡申请技巧|信用卡申请|神州租车|pp租车|信用卡申请条件|租车多少钱一天|婚纱照图片唯美|代驾|存款利率|神舟租车|婚纱照图片大全|医疗保险|婚纱|生育保险|护照办理流程|鲜花|学车技巧|银行存款利率|银行利息怎么算|申请信用卡|信用卡|商业银行|保险查询|一嗨租车|ume国际影城|医疗保险查询|驾校|新世纪影城|搬家吉日查询|邮政信用卡申请|摄影|e代驾官网|婚纱礼服|e代驾|快递加盟|浦发银行信用卡|养老保险查询|万达影城|电影票|影讯|万达影城影讯|银行利率|平安银行官网|信用社|信用卡还款|婚纱图片|旅游团购网|聚划算官网|百度团购|窝窝网|蘑菇街团购|糯米|返利网|团购|反利网|团购网|拉手网团购网|美团|金东商城|电商|保定独立团|网购网站大全|拉手网团购美食|购物网站|聚划算今日团购|网上购物|返利网可信吗|团购网站大全|返利网怎么返利|国美|51返利网|翼支付|附近的团购|京都商城|b2b|电商是什么|800团购|糯米手机|360团购|糯米团购网|糯米网团购下载|糯米网团购|苏宁云商|百度糯米团购|购物网站大全|美团网|购物网|大众点评网团购|qq网购商城|电影票团购|好吃妹团购网|团购电影票|有利网安全吗|p2p|怎么让眼睛变大|pos|分组发光字|股票软件|芜湖方特|第一p2p|试客联盟|企业邮箱|iso|余额宝有风险吗|logo设计|平面设计|风凰网|奶瓶|用手机怎么赚钱|荷花|晋城在线|怎么变白|财经网|身上长小红点|c++|办公软件|余额宝怎么用|广告设计|微信营销|c语言|威锋|电池修复|英语在线翻译|ios8|电子秤|alt|威锋论坛|ios8.1|131458信誉查询|ios8.0.2|威锋网|ios7.1.2|光纤|p2p是什么意思|erp系统|房贷计算器|ios|移动客户端|空间宝app|法语翻译|集分宝|office办公软件|罗塞塔项目|短信软件|话费充值|微云网页版|51自学网|大众点评网|c语言入门|签名设计|全民挂机|余额宝安全吗|大q手机|大众点评|手机网|ios8越狱|滴滴打车|c语言程序设计|apple id|电脑开不了机|十六番|整容天后|尖锐|晋商贷|网贷天眼|抽风|虫虫助手|土豪钱多多|幼儿故事|王家大院|欧弟打呼噜|传张歆艺离婚|漆黑的魅影|泰安太阳部落|后宫的规条|横店影视城|古装婚纱照|钱多多|沙家浜|麻辣烫什么意思|聚宝盆|积木盒子|太阳部落|亲子鉴定|泡芙|抽风crazy|天津之眼|斩赤红之瞳|麻辣香锅|幻听|电竞泡沫|刀塔传奇巫医|刀塔传奇猴子|贝贝|big笑工坊官网|虎扑篮球|披萨|樱花|王蓉精神病|joker|鬼屋|咖啡之翼|杨幂丰胸秘籍|横店影视城门票|coco都可茶饮|英魂之刃官网|钱大掌柜|去吧皮卡丘|童话村电影网|猫屎咖啡|连环夺宝|青鸟|开锁|酸辣粉|化妆步骤|秦时明月|披萨的做法|秦时明月官网|剑魂之刃辅助|80s电影网|去吧皮卡丘官网|放开那三国|魅影|希尔顿酒店|ake小包子|结婚|紫薇|健身女神|血钻野燕麦官网|纳豆|电影网1905|云海app|致爱丽丝|开锁技巧|甜甜圈|主公莫慌|开锁技术大全|格斗|小包子|芍药|神魔官网|1905电影网|两只老虎|海贼王中文网|埃博拉病毒变异|柠檬tv|电影网站|时空猎人破解版|三国志|奇书网|放开那三国官网|养生堂|暗黑|时空猎人|太古仙域|韩后|寿司的做法|包子|时空猎人下载|潘多拉|秦时明月手游|关东煮|龙纹三国|暗黑黎明|旺财|血钻野燕麦价格|大q|时空猎人交易猫|小提琴|荒莽记|蟒荒记|奔荒纪|盘古越狱|www.1905电影网|莾荒纪|莽慌记|翻糖蛋糕|第二书包网|爱拍马桶|爱拍马桶c|血族bloodline|时空猎人官方版|多酷时空猎人|酸辣粉的做法|窝窝电影网|卤肉的做法|金龟子女儿早恋|爱拍小包子|马云简介|时空猎人多酷|三国乱世|大地数字影院|捕鱼|放开那三国橙卡|泡芙的做法|裸体相亲|天天格斗|eva|莫言的个人空间|精品书城|强生|爆米花手机|可乐鸡翅的做法|蹦蹦网|健康之路|叶璇宠物狗|郑多燕小红帽|广州的士|豆瓣电影|快乐十分|91时空猎人|360时空猎人|汤臣倍健|九游时空猎人|挖土机|暴风魔镜|炸薯条的做法|修仙|银汉时空猎人|广东快乐十分|斗鱼tv|交大豌豆女神|欧冠|交易猫时空猎人|时空猎人360|暗黑复仇者|疾风之刃官网|大理梧桐客栈|喜宝|的"
        let string = "她就是那样的性格，说什么都不带恶意的。” 　　周越不至于去和一个比自己小的女孩子怄气，点点头问道：“嫂子你不是说还有什么若溪，玲玲吗？她们怎么还没回来，待会儿要是她们回来你可别让我去开门，我真怕她们会又把我当成你占我便宜！” 　　“你就在那得意吧，小柔的手可不是随便什么男人的屁股都摸的，她那小巴掌今晚上够你回味的了！”苏秀调侃的笑着。 　　周越翻了翻白眼，道：“我又不是没见过女人。” 　　说着，周越也往楼上自己的房中走去。可是想起一件事情来，周越就问道：“嫂子，你房里有电脑吗？” 　　“没有，这里只有小柔和若溪有笔记本电脑。若溪现在没回来，所以你只能找小柔。”苏秀说的时候满脸的幸灾乐祸。 　　周越一脸的郁闷，怎么连电脑都只有那个小婆娘才有，他还准备去看看自己的邮箱里面有没有新的关于“女神之眸”的资料。 　　看来明天只能去自己购置一台了，他没想过去网吧，他要收到的一些都是绝密性的，在网吧那样的地方太容易被泄露了。 　　　躺在床上，除了一开始陆陆续续的传来沐小柔和徐蕾嬉闹的声音之后，整个家都开始变得安静下"
        let regex = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let results = try! regex.matches(in: string, options: NSRegularExpression.MatchingOptions.init(rawValue: 0), range: NSRange(location: 0, length: string.count))
        for result in results {
            let range = result.range
            let keyword = (string as NSString).substring(with: range)
            print("result:\(result.range) - keyword:\(keyword) ")
        }
    }
}

class StringSperateTest {
    func test() {
        let string = "她就是那！样的性格，说什么都不带恶意的。” 　　周越不至于去和一个比自己小的女孩子怄气，点点头问道：“嫂子你不是说还有什么若溪，玲玲吗？她们怎么还没回来，待会儿要是她们回来你可别让我去开门，我真怕她们会又把我当成你占我便宜！” 　　“你就在那得意吧，小柔的手可不是随便什么男人的屁股都摸的，她那小巴掌今晚上够你回味的了！”苏秀调侃的笑着。 　　周越翻了翻白眼，道：“我又不是没见过女人。” 　　说着，周越也往楼上自己的房中走去。可是想起一件事情来，周越就问道：“嫂子，你房里有电脑吗？” 　　“没有，这里只有小柔和若溪有笔记本电脑？若溪现在没回来，所以你只能找小柔。”苏秀说的时候满脸的幸灾乐祸。 　　周越一脸的郁闷，怎么连电脑都只有那个小婆娘才有，他还准备去看看自己的邮箱里面有没有新的关于“女神之眸”的资料。 　　看来明天只能去自己购置一台了，他没想过去网吧，他要收到的一些都是绝密性的，在网吧那样的地方太容易被泄露了。 　　　躺在床上，除了一开始陆陆续续的传来沐小柔和徐蕾嬉闹的声音之后，整个家都开始变得安静下"
        let result = string.components(separatedBy: CharacterSet.init(charactersIn: "“”。！？"))//.filter { !$0.isEmpty}
        print("StringSperateTest:\(result)")
    }
}
StringSperateTest().test()
