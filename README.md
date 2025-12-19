# ChatGPT AI Model Database

A comprehensive relational database schema designed for a multi-model AI chatbot platform, similar to ChatGPT. This project demonstrates database design principles including normalization, referential integrity, and role-based access control (RBAC).

## 📋 Project Overview

This database system manages the complete lifecycle of AI-powered conversations, supporting multiple AI models (GPT-4, LLaMA, Gemini), user management, session tracking, prompt-response pairs, feedback collection, and usage analytics.

## 🗂️ Database Schema

### Entity Relationship Diagram

```
┌─────────────┐       ┌─────────────┐       ┌─────────────┐
│    User     │───────│  UserRole   │───────│    Role     │
└─────────────┘       └─────────────┘       └─────────────┘
      │                                           
      ├───────────────┬───────────────┐          
      │               │               │          
      ▼               ▼               ▼          
┌─────────────┐ ┌─────────────┐ ┌─────────────┐
│   APIKey    │ │ ChatSession │ │  Feedback   │
└─────────────┘ └─────────────┘ └─────────────┘
                      │               │          
                      ▼               │          
              ┌─────────────┐         │          
              │   Prompt    │─────────┤          
              └─────────────┘         │          
                    │ │               │          
          ┌─────────┘ └─────────┐     │          
          ▼                     ▼     ▼          
  ┌─────────────┐       ┌─────────────┐         
  │ PromptTopic │       │  Response   │─────────┤
  └─────────────┘       └─────────────┘         │
          │                   │                 │
          ▼                   ▼                 ▼
  ┌─────────────┐       ┌─────────────┐ ┌─────────────┐
  │    Topic    │       │   AIModel   │ │    Flag     │
  └─────────────┘       └─────────────┘ └─────────────┘
                              │
                              ▼
                      ┌─────────────┐
                      │ UsageRecord │
                      └─────────────┘
                              │
                              ▼
                      ┌─────────────┐
                      │  SystemLog  │
                      └─────────────┘
```

### Tables (14 Total)

| Table | Description |
|-------|-------------|
| `User` | Stores user profiles with subscription plans (Free, Plus, Enterprise) |
| `Role` | Defines system roles (Admin, User, Instructor, Developer) |
| `UserRole` | Junction table for many-to-many user-role relationships |
| `ChatSession` | Manages conversation sessions with status tracking |
| `Prompt` | Stores user messages/queries |
| `Response` | Stores AI-generated responses |
| `AIModel` | Catalog of available AI models and providers |
| `Topic` | Categorizes conversation topics |
| `PromptTopic` | Junction table linking prompts to topics |
| `Feedback` | User ratings and comments on responses |
| `Flag` | Content moderation flags with severity levels |
| `APIKey` | API key management for programmatic access |
| `UsageRecord` | Token usage and analytics tracking |
| `SystemLog` | System events and audit trail |

## 🤖 Supported AI Models

| Model | Version | Provider |
|-------|---------|----------|
| GPT-4.1 | 4.1 | OpenAI |
| GPT-Mini | 1.0 | OpenAI |
| GPT-4.1 Turbo | 4.1T | OpenAI |
| LLaMA 3.1 | 3.1 | Meta |
| Gemini 1.5 Flash | 1.5F | Google |

## 🔧 Technical Specifications

- **Database**: MySQL 8.0
- **Character Set**: utf8mb4
- **Storage Engine**: InnoDB
- **Normalization**: 3NF (Third Normal Form)

## 🚀 Installation

### Prerequisites
- MySQL 8.0 or higher
- MySQL Workbench (optional, for GUI)

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/thealangrace/ChatGPT_Ai_Model.git
   cd ChatGPT_Ai_Model
   ```

2. **Create the database**
   ```sql
   CREATE DATABASE chatgpt_project;
   USE chatgpt_project;
   ```

3. **Import tables in order** (to maintain referential integrity)
   ```bash
   # Core tables first
   mysql -u username -p chatgpt_project < chatgpt_project_user.sql
   mysql -u username -p chatgpt_project < chatgpt_project_role.sql
   mysql -u username -p chatgpt_project < chatgpt_project_aimodel.sql
   mysql -u username -p chatgpt_project < chatgpt_project_topic.sql
   
   # Junction and dependent tables
   mysql -u username -p chatgpt_project < chatgpt_project_userrole.sql
   mysql -u username -p chatgpt_project < chatgpt_project_apikey.sql
   mysql -u username -p chatgpt_project < chatgpt_project_chatsession.sql
   mysql -u username -p chatgpt_project < chatgpt_project_prompt.sql
   mysql -u username -p chatgpt_project < chatgpt_project_response.sql
   mysql -u username -p chatgpt_project < chatgpt_project_prompttopic.sql
   mysql -u username -p chatgpt_project < chatgpt_project_feedback.sql
   mysql -u username -p chatgpt_project < chatgpt_project_flag.sql
   mysql -u username -p chatgpt_project < chatgpt_project_usagerecord.sql
   mysql -u username -p chatgpt_project < chatgpt_project_systemlog.sql
   ```

   **Or import all at once:**
   ```bash
   cat chatgpt_project_*.sql | mysql -u username -p chatgpt_project
   ```

## 📊 Sample Queries

### Get all conversations for a user
```sql
SELECT u.FullName, cs.Title, cs.Status, cs.StartTime
FROM User u
JOIN ChatSession cs ON u.UserID = cs.UserID
WHERE u.Email = 'utsav@example.com';
```

### View prompts with their responses and model used
```sql
SELECT p.MessageText AS Question, 
       r.ResponseText AS Answer, 
       m.ModelName
FROM Prompt p
JOIN Response r ON p.PromptID = r.PromptID
JOIN AIModel m ON r.ModelID = m.ModelID;
```

### Calculate average feedback rating by AI model
```sql
SELECT m.ModelName, 
       AVG(f.Rating) AS AvgRating,
       COUNT(f.FeedbackID) AS TotalFeedback
FROM Feedback f
JOIN Response r ON f.ResponseID = r.ResponseID
JOIN AIModel m ON r.ModelID = m.ModelID
GROUP BY m.ModelName;
```

### Get token usage statistics by user
```sql
SELECT u.FullName, 
       SUM(ur.TokensUsed) AS TotalTokens,
       COUNT(ur.UsageID) AS TotalInteractions
FROM User u
JOIN ChatSession cs ON u.UserID = cs.UserID
JOIN UsageRecord ur ON cs.SessionID = ur.SessionID
GROUP BY u.UserID;
```

### Find flagged content with details
```sql
SELECT p.MessageText, r.ResponseText, f.Reason, f.Severity
FROM Flag f
LEFT JOIN Prompt p ON f.PromptID = p.PromptID
LEFT JOIN Response r ON f.ResponseID = r.ResponseID;
```

## 🔐 Key Features

- **Multi-Model Support**: Flexible architecture supporting multiple AI providers
- **Role-Based Access Control**: Granular permissions through UserRole junction table
- **Usage Analytics**: Comprehensive token tracking and usage records
- **Feedback System**: 5-star rating with comments for response quality
- **Content Moderation**: Flag system with severity levels for content review
- **Topic Classification**: Many-to-many relationship for prompt categorization
- **Audit Trail**: System logging for tracking events and changes

## 📁 Project Structure

```
ChatGPT_Ai_Model/
├── README.md
├── chatgpt_project_user.sql
├── chatgpt_project_role.sql
├── chatgpt_project_userrole.sql
├── chatgpt_project_aimodel.sql
├── chatgpt_project_chatsession.sql
├── chatgpt_project_prompt.sql
├── chatgpt_project_response.sql
├── chatgpt_project_topic.sql
├── chatgpt_project_prompttopic.sql
├── chatgpt_project_feedback.sql
├── chatgpt_project_flag.sql
├── chatgpt_project_apikey.sql
├── chatgpt_project_usagerecord.sql
└── chatgpt_project_systemlog.sql
```

## 🎯 Use Cases

- **Educational**: Learning database design and SQL concepts
- **Portfolio**: Demonstrating database modeling skills
- **Foundation**: Base schema for building AI chatbot applications
- **Reference**: Example of normalized database with proper relationships

## 🛠️ Future Enhancements

- [ ] Add stored procedures for common operations
- [ ] Implement database triggers for automatic logging
- [ ] Create views for reporting dashboards
- [ ] Add indexes for query optimization
- [ ] Implement soft delete functionality

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 👤 Author

**Alan Grace**
- GitHub: [@thealangrace](https://github.com/thealangrace)

---

⭐ If you found this project helpful, please consider giving it a star!
