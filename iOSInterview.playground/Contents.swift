//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

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


