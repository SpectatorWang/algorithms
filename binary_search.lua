-- 函数说明：二分查找算法，在有序数组中查找某一特定元素的搜索算法。
--
-- @param   {array} array 数组
-- @param   {int}   value 需要查询的数
--
-- @return 空
local binary_search = function(array, value)
    local low = 1
    local high = #array
    local mid = 1
    while (low <= high) do
        -- 如果使用 (low + high) / 2 有可能计算 low + high 的时溢出
        mid = math.ceil(low + (high - low) / 2)
        if(value == array[mid]) then
            return mid
        end
        if(value < array[mid]) then
            high = mid - 1
        else
            low = mid + 1
        end
    end
    return 0
end
return binary_search
-- local array = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 13, 15, 354}
-- local index = binary_search(array, 15)

