local swap = function(array, index1, index2)
    local temp = array[index2]
    array[index2] = array[index1]
    array[index1] = temp;
end

local heapadjust = function(array, parent, len)
    local child = 1;
    local value = array[parent];
    child = 2 * parent
    while (child <= len) do
        if (child < len and array[child] < array[child + 1]) then
            child = child + 1 
        end
        if (value < array[child]) then
            array[parent] = array[child]
        else
            break
        end 
        parent = child
        child = 2 * parent
    end
    array[parent] = value
end

-- 函数说明：堆排序，堆积是一个近似完全二叉树的结构（二叉堆），
-- 并同时满足堆积的性质：即子结点的键值或索引总是小于(或者大于)它的父节点。。
--
-- @param   {array} array 数组
-- @param   {int}   len 数组长度
--
-- @return 空
local heapsort = function(array, len)
    local i = math.floor(len / 2)
    for i = i, 1, -1 do
        heapadjust(array, i, len)
    end

    for i = len, 1, -1 do
        swap(array, 1, i);
        heapadjust(array, 1, i - 1);
    end
end

return heapsort
--[[
local arr = {40, 32, 52, 22, 32, 55, 10}
heapsort(arr, #arr)

       40
   32      52       ->
22   32  55   10
--------------------------------
       40
   32      55       ->
22   32  52   10
--------------------------------
       55
   32      52       -> 
22   32  40   10
--------------------------------
now frist index is max.
loop:
    swap(frist, last) get max
    heapadjust(1, len - 1)
]]--
