INSERT INTO laws (id, law_number, title, summary) VALUES
(1, 11, 'Việt vị', 'Quy định khi nào cầu thủ ở vị trí việt vị và khi nào bị phạt vì việt vị.'),
(2, 12, 'Lỗi và hành vi sai trái', 'Quy định các lỗi bị phạt đá phạt, phạt đền và các trường hợp bị thẻ.'),
(3, 14, 'Quả phạt đền', 'Quy định thủ tục thực hiện quả phạt đền.');

INSERT INTO sanctions (id, name, kind, description) VALUES
(1, 'Đá phạt trực tiếp', 'restart', 'Có thể ghi bàn trực tiếp vào lưới đối phương.'),
(2, 'Đá phạt gián tiếp', 'restart', 'Bóng phải chạm thêm một cầu thủ khác trước khi vào lưới.'),
(3, 'Phạt đền', 'restart', 'Áp dụng khi lỗi thuộc diện đá phạt trực tiếp xảy ra trong khu phạt của đội phạm lỗi.'),
(4, 'Thẻ vàng', 'card', 'Cảnh cáo cầu thủ.'),
(5, 'Thẻ đỏ', 'card', 'Truất quyền thi đấu cầu thủ.');

INSERT INTO offences (id, law_id, name, description) VALUES
(1, 2, 'Đá hoặc cố đá đối phương', 'Đá hoặc cố đá đối phương một cách bất cẩn, liều lĩnh hoặc dùng vũ lực quá mức.'),
(2, 2, 'Chơi bóng bằng tay có chủ ý', 'Cầu thủ (không phải thủ môn trong khu phạt của mình) cố ý dùng tay hoặc cánh tay chơi bóng.'),
(3, 2, 'Chơi nguy hiểm', 'Hành động có thể gây nguy hiểm cho bản thân hoặc đối phương.'),
(4, 2, 'Chơi thô bạo nghiêm trọng', 'Tranh bóng dùng vũ lực quá mức hoặc gây nguy hiểm cho đối phương.');

INSERT INTO offence_sanctions (offence_id, sanction_id) VALUES
(1, 1), (2, 1), (3, 2), (4, 1), (4, 5);

INSERT INTO glossary (id, term, definition, law_id) VALUES
(1, 'Việt vị', 'Cầu thủ ở vị trí việt vị khi tham gia vào pha bóng có thể bị phạt theo Luật 11.', 1);