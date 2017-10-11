-- 函数说明：数组拷贝
--
-- @param   {array} src 源数组
-- @param   {int}   srcPos 源数组拷贝起始index
-- @param   {array} dest 目标数组
-- @param   {int}   destPos 目标数组起始index
-- @param   {int}   length 拷贝长度
--
-- @return 空
local arraycopy = function(src, srcPos, dest, destPos, length)
    if(length <= 0 ) then return end
    for index = length - 1, 0, -1 do
        dest[destPos + index] = src[srcPos + index]
    end
end

-- 函数说明：合并排序，从中间分隔，左右两边的数都是递归排好序的，在合并的时候就可以递增比较合并了。
--
-- @param   {array} src 需要排序的数组
-- @param   {array} buffer 缓存数组
-- @param   {int}   start 排序的起始index
-- @param   {int}   mid 排序的中间index
-- @param   {int}   end_ 排序的结束index
--
-- @return 空
local merge = function(source, buffer, start, mid, end_)
    local i = start
    local k = start
    local j = mid + 1
    while (i <= mid and j < end_ + 1) do
        if (source[i] > source[j]) then
            buffer[k] = source[j]
            k = k + 1
            j = j + 1
        else
            buffer[k] = source[i]
            k = k + 1
            i = i + 1
        end
    end
    if (i ~= mid + 1) then
        arraycopy(source, i, source, i + (j - mid - 1), mid - i + 1)
    end
    arraycopy(buffer, start, source, start, i - start + j - mid - 1)
end

local mergeSort

-- 函数说明：合并排序
--
-- @param   {array} array 需要排序的数组
-- @param   {array} temp 缓存数组
-- @param   {int}   start 排序的起始index
-- @param   {int}   end_ 排序的结束index
--
-- @return 空
mergeSort = function(array, temp, start, end_)
    if(start < end_) then
        local midIndex = math.floor((start + end_) / 2)
        mergeSort(array, temp, start, midIndex)
        mergeSort(array, temp, midIndex + 1, end_)
        merge(array, temp, start, midIndex, end_)
    end
end

-- local array = {3, 4, 2, 1, 5, 7, 9 , 332, 1, 32, 434, 332}
-- {3, 4, 2, 1, 5, 7, 9 , 332, 1, 32, 434, 332} -> {1, 1, 2, 3, 4, 5, 9, 32, 332, 332 ,434}
-- {3, 4, 2, 1, 5, 7}{9 , 332, 1, 32, 434, 332} -> {1, 2, 3, 4, 5, 7}{1, 9, 32, 332, 332, 434}
-- {3, 4, 2}{1, 5, 7} -> {2, 3 ,4}{1, 5, 7}
-- {3, 4}{2} -> {2, 3, 4}
-- {3}{4}
-- 从中间分隔，左右两边的数都是递归排好序的，在合并的时候就可以递增比较合并了。
-- local temp = {}
-- mergeSort(array, temp, 1, #array)
