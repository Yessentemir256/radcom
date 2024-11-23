CREATE TABLE dicom_files (
    id SERIAL PRIMARY KEY,                -- Уникальный идентификатор файла
    patient_id TEXT NOT NULL,             -- Идентификатор пациента
    patient_name TEXT NOT NULL,           -- Имя пациента
    study_instance_uid TEXT NOT NULL,     -- Уникальный идентификатор исследования
    series_instance_uid TEXT,             -- Уникальный идентификатор серии
    sop_instance_uid TEXT NOT NULL,       -- Уникальный идентификатор объекта (DICOM SOP Instance)
    modality TEXT,                        -- Модальность (например, CT, MR)
    study_date DATE,                      -- Дата исследования
    description TEXT,                     -- Описание файла или исследования
    dicom_file_path TEXT NOT NULL,        -- Путь к файлу на диске (например, C:\dicom_files\file.dcm)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Время загрузки файла
);
