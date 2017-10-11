-- low值做拆分的pivotekey，将数字拆分成两块。
-- pivotkey在多次交换后，会形成左边比pivotekey小，右边pivotekey大。
-- {4, 5, 1, 3, 8, 7} pivotkey: 4
-- 4, 5, 1, 3, 8, 7 ->
-- l        .  .  h
-- 3, 5, 1, 3, 8, 7 ->
-- l  .     h
-- 3, 5, 1, 5, 8, 7 ->
-- l  .  h
-- 3, 1, 1, 5, 8, 7 -> (while end)
--       lh
-- 3, 1, 4, 5, 8, 7 -> (pivotkey is 4, left lower, right bigger)
local partition = function(array, low, high)
    local pivotkey = array[low]

    while (low < high) do
        while (low < high and array[high] > pivotkey) do
            high = high - 1
        end

        if (low < high) then
            array[low] = array[high]
            low = low + 1
        end

        while (low < high and array[low] <= pivotkey) do
            low = low + 1
        end

        if(low < high) then
            array[high] = array[low]
            high = high - 1
        end
    end
    array[low] = pivotkey
    return low
end

local quicksort

-- 函数说明：快速排序
--
-- @param   {array} array 需要排序的数组
-- @param   {int}   low 排序的起始index
-- @param   {int}   high 排序的结束index
--
-- @return 空
quicksort = function(array, low, high)
    if (low < high) then
        local middle = partition(array, low, high)
        if (low < middle - 1) then
            quicksort(array, low, middle - 1)
        end
        if (middle + 1 < high) then
            quicksort(array, middle + 1, high)
        end
    end
end

return quicksort

