import Debug"mo:base/Debug";
import Array "mo:base/Array";
import Int "mo:base/Int";

actor {
    func quicksort(
            tl : [var Int],
            l : Int,
            r : Int
        ) {
            if (l < r) {
                var i = l;
                var j = r;
                var key  = tl[Int.abs(l)];
                while (i < j) {
                    while(i < j  and tl[Int.abs(j)] >= key){
                        j -= 1;
                    };
                    if(i < j){
                        tl[Int.abs(i)] := tl[Int.abs(j)];
                        i +=1;
                    };
                    while(i < j and tl[Int.abs(i)] < key){
                        i += 1;
                    };
                    if(i < j){
                        tl[Int.abs(j)] := tl[Int.abs(i)];
                        j -= 1;
                    };
                };
            tl[Int.abs(i)] := key;
            quicksort(tl,l,i-1);
            quicksort(tl,i+1,r);
            };
    };


    
    public func qsort(tl : [Int]) : async [Int] {
        let n = tl.size();

        if (n < 2) {
            return tl;
        } else {
            let result:[var Int] = Array.thaw(tl);
            quicksort(result, 0, n - 1);
            Debug.print(debug_show(result));
            return Array.freeze(result);
        };
    };
};
