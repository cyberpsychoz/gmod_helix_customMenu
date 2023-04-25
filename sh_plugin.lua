PLUGIN.name = "Background Changer"
PLUGIN.description = "Changes the background in the character creation menu to an image."
PLUGIN.author = "Крыжовник#4511"

-- Путь к изображению, которое будет использоваться в качестве фона
local background = Material("path/to/your/image.png")

-- Переопределение функции ix.char.IsMenuBackgroundVisible
function PLUGIN:ix.char.IsMenuBackgroundVisible()
    -- Возвращаем false, чтобы скрыть стандартный фон
    return false
end

-- Переопределение функции ix.char.DrawBackgroundBlur
function PLUGIN:ix.char.DrawBackgroundBlur()
    -- Рисуем изображение на фоне
    surface.SetDrawColor(255, 255, 255, 255) -- Устанавливаем цвет в белый
    surface.SetMaterial(background) -- Устанавливаем материал в наше изображение
    surface.DrawTexturedRect(0, 0, ScrW(), ScrH()) -- Рисуем прямоугольник с текстурой на весь экран
end

-- Есть еще вариант сделать так, чтобы игрок мог менять фон, с помощью команды
--[[

-- Добавляем список изображений для фона
local backgrounds = {
    "path/to/image1.png",
    "path/to/image2.png",
    "path/to/image3.png"
}

-- Добавляем команду чата для выбора изображения
ix.command.Add("SetBackground", {
    description = "Sets the background image for the character creation menu.",
    arguments = ix.type.number,
    OnRun = function(self, client, index)
        -- Проверяем, что индекс в пределах списка
        if index > 0 and index <= #backgrounds then
            -- Устанавливаем изображение для фона
            background = Material(backgrounds[index])
            -- Отправляем сообщение об успешном выборе
            return "You have set the background to " .. backgrounds[index]
        else
            -- Отправляем сообщение об ошибке
            return "Invalid background index. Please choose a number between 1 and " .. #backgrounds
        end
    end
}) ]]
