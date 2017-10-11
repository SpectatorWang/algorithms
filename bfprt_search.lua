local insert_sort = require('insert_sort')
local swap = function(array, index1, index2)
    local temp = array[index2]
    array[index2] = array[index1]
    array[index1] = temp;
end

local partition = function(array, low, high, pivot_index)
    local pivot_value = array[pivot_index]
    swap(array, low, pivot_index)

    while (low < high) do
        while (low < high and array[high] >= pivot_value) do
            high = high - 1 
        end
        if (low < high) then
            array[low] = array[high]
            low = low + 1
        end

        while (low < high and array[low] <= pivot_value) do
            low = low + 1
        end
        if(low < high) then
            array[high] = array[low]
            high = high - 1
        end
    end
    array[low] = pivot_value
    return low
end

local select
local K_GROUP_SIZE = 5

-- 函数说明：BFPRT 算法解决的问题十分经典，即从某n个元素的序列中选出第 k 小（第 k 大）的元素，通过巧妙的分析，BFPRT 可以保证在最坏情况下仍为线性时间复杂度。
--
-- @param   {array} array 数组
-- @param   {int}   left 数组起点
-- @param   {int}   right 数组终点
-- @param   {int}   k 第几大
--
-- @return 空
select = function(array, left, right, k)
    local size = right - left + 1
    if (size <= K_GROUP_SIZE) then
        insert_sort(array, left, right)
        return array[k + left - 1]
    end

    local num_group = math.ceil(size / K_GROUP_SIZE)

    for i = 0, num_group - 1, 1 do
        local sub_left = left + i * K_GROUP_SIZE
        local sub_right = sub_left + K_GROUP_SIZE - 1
        if (sub_right > right) then
            sub_right = right
        end
        insert_sort(array, sub_left, sub_right)
        local median = sub_left + math.floor((sub_right - sub_left) / 2);
        swap(array, left + i, median);

    end

    local pivot_index = left + math.floor((num_group - 1) / 2)

    select(array, left, left + num_group - 1, math.floor((num_group + 1) / 2))

    local mid_index = partition(array, left, right, pivot_index)
    local _ith = mid_index - left + 1

    if (k == _ith) then
        return array[mid_index]
    elseif (k < _ith) then
        return select(array, left, mid_index - 1, k)
    else 
        return select(array, mid_index + 1, right, k - _ith)
    end
end

return select
-- local arr = {15, 16, 7, 8, 29, 10, 11, 12, 13}
-- local value = select(arr, 1, #arr, 4)
