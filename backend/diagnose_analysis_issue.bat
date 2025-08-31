@echo off
echo ==========================================================
echo              智能分析板块问题诊断工具
echo ==========================================================
echo.

cd /d "e:\PyCharm\condaProjects\data_Visualization_Project_Design\backend"

echo 🔍 正在诊断智能分析板块不显示的问题...
echo.

echo 步骤1: 检查ML模块状态
echo -------------------------------------------------------
python -c "
import sys
import os
sys.path.insert(0, os.getcwd())

try:
    from ml_services import LearningBehaviorClustering, AnomalyDetector
    print('✅ ML模块导入成功')
    
    # 测试初始化
    clustering = LearningBehaviorClustering()
    detector = AnomalyDetector()
    print('✅ 模型初始化成功')
    
except Exception as e:
    print(f'❌ ML模块问题: {str(e)}')
"

echo.
echo 步骤2: 检查数据库连接和用户数据
echo -------------------------------------------------------
python -c "
import sys
import os
sys.path.insert(0, os.getcwd())

try:
    from app import app, User, db
    
    with app.app_context():
        user_count = User.query.count()
        print(f'✅ 数据库连接正常，用户数量: {user_count}')
        
        if user_count < 3:
            print(f'⚠️ 用户数量不足，需要至少3个用户才能进行智能分析')
        else:
            print(f'✅ 用户数量充足，可以进行智能分析')
            
except Exception as e:
    print(f'❌ 数据库连接问题: {str(e)}')
"

echo.
echo 步骤3: 测试智能分析API
echo -------------------------------------------------------
python test_analysis_quick.py

echo.
echo 步骤4: 解决方案和建议
echo -------------------------------------------------------
echo 📋 常见问题及解决方案:
echo.
echo 问题1: 模型训练成功但智能分析板块空白
echo 解决: 1. 切换到智能分析标签页
echo       2. 点击"刷新分析"按钮
echo       3. 或者重新进行模型训练
echo.
echo 问题2: 聚类分析或异常检测API返回错误
echo 解决: 1. 确保用户数量 ≥ 3
echo       2. 检查数据完整性
echo       3. 重新启动Flask服务器
echo.
echo 问题3: 前端显示加载中但一直不出结果
echo 解决: 1. 检查浏览器开发者工具的网络请求
echo       2. 查看Flask控制台的错误日志
echo       3. 检查CORS配置
echo.
echo 🚀 推荐操作步骤:
echo -------------------------------------------------------
echo 1. 重启Flask服务器: python app.py
echo 2. 在浏览器中访问管理员页面
echo 3. 点击"智能分析"标签页
echo 4. 如果空白，点击"刷新分析"按钮
echo 5. 如果仍然空白，先进行"模型训练"
echo 6. 训练完成后系统会自动刷新智能分析数据
echo.
echo 💡 调试技巧:
echo - 打开浏览器开发者工具(F12)
echo - 查看Console标签页的错误信息
echo - 查看Network标签页的API请求响应
echo - 观察Flask控制台的实时日志
echo.
echo ==========================================================
echo                  诊断完成
echo ==========================================================

pause