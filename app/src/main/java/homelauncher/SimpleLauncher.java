package homelauncher;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class SimpleLauncher {
    
    private static final String MINECRAFT_DIR = System.getProperty("user.home") + "/HOMELauncheR";
    private static final String VERSIONS_DIR = MINECRAFT_DIR + "/versions";
    private static final String MODS_DIR = MINECRAFT_DIR + "/mods";
    private static final String FPV2_DIR = MINECRAFT_DIR + "/fpv2";
    
    private static final List<String> AVAILABLE_VERSIONS = Arrays.asList(
        "1.21.1", "1.20.4", "1.20.1", "1.19.4", "1.18.2", "1.17.1", "1.16.5", "1.15.2", "1.14.4", "1.13.2"
    );
    
    private static final Map<String, String> VERSION_DOWNLOAD_LINKS = new HashMap<>();
    
    static {
        VERSION_DOWNLOAD_LINKS.put("1.21.1", "https://example-mirror.com/minecraft/1.21.1/client.jar");
        VERSION_DOWNLOAD_LINKS.put("1.20.4", "https://example-mirror.com/minecraft/1.20.4/client.jar");
        VERSION_DOWNLOAD_LINKS.put("1.20.1", "https://example-mirror.com/minecraft/1.20.1/client.jar");
        VERSION_DOWNLOAD_LINKS.put("1.19.4", "https://example-mirror.com/minecraft/1.19.4/client.jar");
        VERSION_DOWNLOAD_LINKS.put("1.18.2", "https://example-mirror.com/minecraft/1.18.2/client.jar");
        VERSION_DOWNLOAD_LINKS.put("1.17.1", "https://example-mirror.com/minecraft/1.17.1/client.jar");
        VERSION_DOWNLOAD_LINKS.put("1.16.5", "https://example-mirror.com/minecraft/1.16.5/client.jar");
        VERSION_DOWNLOAD_LINKS.put("1.15.2", "https://example-mirror.com/minecraft/1.15.2/client.jar");
        VERSION_DOWNLOAD_LINKS.put("1.14.4", "https://example-mirror.com/minecraft/1.14.4/client.jar");
        VERSION_DOWNLOAD_LINKS.put("1.13.2", "https://example-mirror.com/minecraft/1.13.2/client.jar");
    }
    
    public static void main(String[] args) {
        System.out.println("=========================================");
        System.out.println("    HOMELauncheR - Minecraft Piracy Edition");
        System.out.println("=========================================");
        System.out.println();
        
        createDirectories();
        loadPreinstalledVersion();
        
        Scanner scanner = new Scanner(System.in);
        
        while (true) {
            printMenu();
            System.out.print("Выберите действие: ");
            String choice = scanner.nextLine();
            
            switch (choice) {
                case "1":
                    listVersions();
                    break;
                case "2":
                    downloadVersion(scanner);
                    break;
                case "3":
                    launchMinecraft(scanner);
                    break;
                case "4":
                    setupFpv2Server();
                    break;
                case "5":
                    openFpv2Folder();
                    break;
                case "6":
                    System.out.println("Выход из лаунчера...");
                    scanner.close();
                    return;
                default:
                    System.out.println("Неверный выбор. Попробуйте снова.");
            }
        }
    }
    
    private static void createDirectories() {
        try {
            Files.createDirectories(Paths.get(VERSIONS_DIR));
            Files.createDirectories(Paths.get(MODS_DIR));
            Files.createDirectories(Paths.get(FPV2_DIR));
            System.out.println("Директории созданы в: " + MINECRAFT_DIR);
        } catch (IOException e) {
            System.out.println("Ошибка создания директорий: " + e.getMessage());
        }
    }
    
    private static void loadPreinstalledVersion() {
        try {
            Path version1211 = Paths.get(VERSIONS_DIR, "minecraft-1.21.1.jar");
            if (!Files.exists(version1211)) {
                Files.createFile(version1211);
                System.out.println("Создана предустановленная версия 1.21.1");
            }
            
            Path serverConfig = Paths.get(FPV2_DIR, "server.properties");
            String config = "server=costs-guide.gl.joinmc.link\n" +
                           "version=1.21.1\n" +
                           "mods_enabled=true\n" +
                           "fpv2_optimized=true";
            Files.write(serverConfig, config.getBytes());
            
            System.out.println("Предустановленная версия 1.21.1 с модами готова!");
        } catch (IOException e) {
            System.out.println("Ошибка загрузки предустановленной версии: " + e.getMessage());
        }
    }
    
    private static void printMenu() {
        System.out.println("\n=== МЕНЮ HOMELauncheR ===");
        System.out.println("1. Список доступных версий");
        System.out.println("2. Скачать версию");
        System.out.println("3. Запустить Minecraft");
        System.out.println("4. Настроить сервер fpv2");
        System.out.println("5. Открыть папку fpv2");
        System.out.println("6. Выход");
        System.out.println("=========================");
    }
    
    private static void listVersions() {
        System.out.println("\nДоступные версии Minecraft:");
        for (int i = 0; i < AVAILABLE_VERSIONS.size(); i++) {
            String version = AVAILABLE_VERSIONS.get(i);
            Path versionFile = Paths.get(VERSIONS_DIR, "minecraft-" + version + ".jar");
            String status = Files.exists(versionFile) ? "[УСТАНОВЛЕНА]" : "[НЕ УСТАНОВЛЕНА]";
            System.out.println((i + 1) + ". Minecraft " + version + " " + status);
        }
    }
    
    private static void downloadVersion(Scanner scanner) {
        System.out.println("\nВыберите версию для скачивания:");
        for (int i = 0; i < AVAILABLE_VERSIONS.size(); i++) {
            System.out.println((i + 1) + ". " + AVAILABLE_VERSIONS.get(i));
        }
        
        System.out.print("Введите номер версии: ");
        try {
            int choice = Integer.parseInt(scanner.nextLine());
            if (choice < 1 || choice > AVAILABLE_VERSIONS.size()) {
                System.out.println("Неверный выбор.");
                return;
            }
            
            String version = AVAILABLE_VERSIONS.get(choice - 1);
            System.out.println("Начинаем загрузку Minecraft " + version + "...");
            
            // Симуляция загрузки
            for (int i = 0; i <= 100; i += 10) {
                StringBuilder progressBar = new StringBuilder();
                int equalsCount = i / 10;
                int spacesCount = 10 - equalsCount;
                
                for (int j = 0; j < equalsCount; j++) progressBar.append("=");
                for (int j = 0; j < spacesCount; j++) progressBar.append(" ");
                
                System.out.print("\rПрогресс: [" + progressBar.toString() + "] " + i + "%");
                try {
                    Thread.sleep(200);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            }
            
            Path versionFile = Paths.get(VERSIONS_DIR, "minecraft-" + version + ".jar");
            try {
                Files.createFile(versionFile);
                System.out.println("\n\nВерсия " + version + " успешно скачана!");
            } catch (IOException e) {
                System.out.println("\nОшибка создания файла: " + e.getMessage());
            }
            
        } catch (NumberFormatException e) {
            System.out.println("Неверный формат номера.");
        }
    }
    
    private static void launchMinecraft(Scanner scanner) {
        System.out.println("\nДоступные установленные версии:");
        List<String> installedVersions = new ArrayList<>();
        
        for (String version : AVAILABLE_VERSIONS) {
            Path versionFile = Paths.get(VERSIONS_DIR, "minecraft-" + version + ".jar");
            if (Files.exists(versionFile)) {
                installedVersions.add(version);
                System.out.println((installedVersions.size()) + ". Minecraft " + version);
            }
        }
        
        if (installedVersions.isEmpty()) {
            System.out.println("Нет установленных версий. Сначала скачайте версию.");
            return;
        }
        
        System.out.print("Выберите версию для запуска: ");
        try {
            int choice = Integer.parseInt(scanner.nextLine());
            if (choice < 1 || choice > installedVersions.size()) {
                System.out.println("Неверный выбор.");
                return;
            }
            
            String version = installedVersions.get(choice - 1);
            System.out.println("Запуск Minecraft " + version + "...");
            System.out.println("Подключение к серверу: costs-guide.gl.joinmc.link");
            System.out.println("Игра запускается... (симуляция)");
            
            // Симуляция запуска игры
            for (int i = 0; i < 3; i++) {
                System.out.print(".");
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            }
            
            System.out.println("\nMinecraft успешно запущен!");
            
        } catch (NumberFormatException e) {
            System.out.println("Неверный формат номера.");
        }
    }
    
    private static void setupFpv2Server() {
        System.out.println("\n=== Настройка сервера fpv2 ===");
        System.out.println("Сервер: costs-guide.gl.joinmc.link");
        System.out.println("Версия: 1.21.1");
        System.out.println("Оптимизация: включена");
        
        try {
            Path serverConfig = Paths.get(FPV2_DIR, "server_config.txt");
            String config = "server=costs-guide.gl.joinmc.link\n" +
                           "version=1.21.1\n" +
                           "mods_enabled=true\n" +
                           "fpv2_optimized=true\n" +
                           "connection_timeout=30\n" +
                           "max_players=100";
            Files.write(serverConfig, config.getBytes());
            
            System.out.println("Конфигурация сервера сохранена в: " + serverConfig);
        } catch (IOException e) {
            System.out.println("Ошибка сохранения конфигурации: " + e.getMessage());
        }
    }
    
    private static void openFpv2Folder() {
        System.out.println("\nОткрытие папки fpv2...");
        System.out.println("Путь: " + FPV2_DIR);
        
        try {
            // Создаем несколько примеров файлов в папке fpv2
            Path readme = Paths.get(FPV2_DIR, "README.txt");
            Files.write(readme, "Папка fpv2 для сервера costs-guide.gl.joinmc.link\n".getBytes());
            
            Path modsList = Paths.get(FPV2_DIR, "recommended_mods.txt");
            Files.write(modsList, ("1. OptiFine\n2. JourneyMap\n3. JEI\n4. Xaero's Minimap\n").getBytes());
            
            System.out.println("Папка fpv2 содержит:");
            System.out.println("- server_config.txt - конфигурация сервера");
            System.out.println("- README.txt - информация о папке");
            System.out.println("- recommended_mods.txt - рекомендуемые моды");
            
        } catch (IOException e) {
            System.out.println("Ошибка создания файлов: " + e.getMessage());
        }
    }
}