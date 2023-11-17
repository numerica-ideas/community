import * as React from 'react';
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import CardContent from '@mui/material/CardContent';
import CardActions from '@mui/material/CardActions';
import IconButton, { IconButtonProps } from '@mui/material/IconButton';
import Typography from '@mui/material/Typography';
import MoreVertIcon from '@mui/icons-material/MoreVert';
import { Avatar, Box, Button, CardMedia } from '@mui/material';
import CustomMenu from './menu'

export default function PostCard({post}:any) {
  return (
    <Card sx={{ maxWidth: 345, height: 300 }} style={{display:"flex", flexDirection:"column"}}>
      <CardHeader
        action={
            <CustomMenu post={post}/>
        }
        title={post.title.length>42?`${post.title.substring(0,38)}...`:post.title}
        subheader={new Date(post.publishedAt).toDateString() }
      />
      <Box sx={{ display: 'flex', flexGrow:1 }}/>
      <CardContent>
        <Typography variant="body2" color="text.secondary"
        sx={{
            overflow: 'hidden',
            textOverflow: 'ellipsis',
            display: '-webkit-box',
            WebkitLineClamp: '2',
            WebkitBoxOrient: 'vertical',
         }}>
          {post.content}
        </Typography>
      </CardContent>
      <CardActions>
        <Button size="small">Show More</Button>
      </CardActions>
    </Card>
  );
}